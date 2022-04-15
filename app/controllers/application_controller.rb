class ApplicationController < ActionController::Base
    def hello 
        # render html: 'Hello World'
    end

    def alta_ruta
        # render html: 'Ai intrat pe alta ruta'

    end

    def create_user
        user = User.create(name: params[:bla])
        render html: "Userul a fost creat #{user.id}"
    end

    def main_menu
        
    end

end
