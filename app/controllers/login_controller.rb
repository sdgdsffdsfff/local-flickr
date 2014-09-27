class LoginController < ApplicationController
    def login
        if request.get?
        else
            name = params[:user][:name]
            password = params[:user][:password]

            if name.length == 0
                flash[:error] = "没有用户名!"
                redirect_to login_path
                return
            end

            if password.length == 0
                flash[:error] = "没有输入密码！"
                redirect_to login_path
                return
            end

            @user = User.find_by_name(name)
            if @user.class == NilClass
                redirect_to login_error_path
            elsif @user.password == password
                redirect_to root_path
            else
                redirect_to login_path
            end
        end
    end
end
