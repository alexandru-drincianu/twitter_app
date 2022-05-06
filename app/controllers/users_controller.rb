class UsersController < ApplicationController

    def index
        @users = User.all
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
        @user = User.create(name:           params['user']['name'], 
                            email:          params['user']['email'],
                            age:            params['user']['age'],
                            gender:         params['user']['gender'],
                            phone_number:   params['user']['phone_number']
        )       

        if @user.save
            flash[:success] = 'User has been created.'
            redirect_to '/users/new'
            # redirect_to "/users/#{user.id}"
        else
            flash[:error] = 'Registration failed'
            redirect_to '/users/new'
        end

    end
end
