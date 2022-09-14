class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    include SessionsHelper

    def authorize
        unless logged_in?
            redirect_to root_url
        end
    end

    def admin?
        unless current_user.user_type == 'A'
            redirect_to request.referrer, notice: "Voce nao tem permissao pra isso!"
        end
     end

end
