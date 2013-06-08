module CdvSession
  class Engine < ::Rails::Engine
    isolate_namespace CdvSession
  end

  module Authenticate
    extend ActiveSupport::Concern
    included do
      before_filter :ensure_authenticated, except: [ :start ]

      def current_user
        @current_user ||= User.find_by_id(session[:user_id])
      end

      def ensure_authenticated
        if session[:user_id].blank?
          render json: { authorized: false }, status: 401
        end
      end
    end
  end

end
