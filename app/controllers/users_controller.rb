class UsersController < ApplicationController

    before_action :check_user, only: [:index, :show]

    def index
        if logged_in?
            @users = User.all
        else
            redirect_to
        end
    end

    def show
        @user = User.where(id: params[:id]).first
        if @user.nil? 
            redirect_to '/users'
        end
    end

    def new
        @user = User.new
    end

    def create
        #@user = User.create(name:           params['user']['name'], 
        #                    email:          params['user']['email'],
        #                   age:            params['user']['age'],
        #                  gender:         params['user']['gender'],
        #                 phone_number:   params['user']['phone_number']
        #)       

        @user = User.new(user_params)

        if @user.save
            flash[:success] = 'User has been created.'
            log_in(@user)
            redirect_to user_path(@user)
        else
            render '/users/new'
        end

    end

    private

    def user_params
        params.require(:user).permit(:name, :email,:age,:gender,:phone_number,:password)
    end

    def check_user
        if !logged_in?
            redirect_to login_path
        end
    end

end
