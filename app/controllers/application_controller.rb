class ApplicationController < ActionController::Base
    def landing
        render "homepage/home"
    end
end
