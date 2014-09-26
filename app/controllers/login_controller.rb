class LoginController < ApplicationController
    def login
        if request.get?
        else
            name = params[:user][:name]
            password = params[:user][:password]

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
