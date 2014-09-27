class IndexController < ApplicationController

    def index
        if session[:user_id] == nil
            redirect_to login_path
        else
            @user = User.find_by_id(session[:user_id])
            @pictures = @user.pictures
        end
    end
end
