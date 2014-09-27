class LoginController < ApplicationController
    def login
        if request.get?
        else
            name = params[:user][:name]
            password = params[:user][:password]

            session[:user_id] = nil

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
                session[:user_id] = @user.id
                redirect_to index_path
            else
                redirect_to login_path
            end
        end
    end
end
