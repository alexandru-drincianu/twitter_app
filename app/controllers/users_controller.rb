class UsersController < ApplicationController

    before_action :check_user, only: [:index, :show, :destroy, :showstatistics]
    before_action :admin_user, only: [:destroy, :update, :showstatistics]

    def index
        @users = User.all
    end

    def show
        @user = User.where(id: params[:id]).first
        @posts = @user.posts.paginate(page: params[:page], per_page: 5)
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

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    def showstatistics
        @users_regular = User.where(admin: false).paginate(page: params[:regular_page], per_page: 1)
        @users_admin = User.where(admin: true).paginate(page: params[:admin_page], per_page: 1)
    end

    def update
        @user = User.find(params[:id])
        @user.update(admin: true)
        redirect_to admin_statistics_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email,:age,:gender,:phone_number,:password)
    end

    def check_user
        #if !logged_in?
        #    redirect_to login_path
        #end
        redirect_to login_path unless logged_in?
    end

    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end

end
