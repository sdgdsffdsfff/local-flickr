class RegisterController < ApplicationController
    def register
        if request.post?

            username = params[:user][:name]
            password = params[:user][:password]
            re_password = params[:user][:re_password]

            @user = User.find_by_name(username)
            if @user.Class == NilClass
                if password != re_password
                    @user = User.new(:name => username, :password => password)
                    @user.save!
                    redirect_to login_path
                elsif
                    "Register password not match!"
                end
            else
                "Already register...."
            end
        end
    end
end
