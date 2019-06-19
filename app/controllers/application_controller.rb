class ApplicationController < ActionController::Base #API
    protect_from_forgery with: :exception

    def fallback_index_html
        render :file => "public/index.html"
    end
    
end
