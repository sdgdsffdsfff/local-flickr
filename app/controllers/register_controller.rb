class RegisterController < ApplicationController
    def register
        if request.post?

            username = params[:user][:name]
            password = params[:user][:password]
            re_password = params[:user][:re_password]

            @user = User.find_by_name(username)
            if @user.class == NilClass

                if username.length == 0 || password.length == 0 || re_password.length == 0
                    flash[:error] = "没有填写完全，不能注册!"
                    redirect_to register_path
                    return
                end

                if password == re_password
                    @user = User.new(:name => username, :password => password)
                    @user.save!
                    redirect_to login_path
                elsif
                    flash[:error] = "两次密码不一致!"
                    redirect_to register_path
                end
            else
                flash[:error] = "已经注册了!" + @user.name
                redirect_to register_path
            end
        end
    end
end
