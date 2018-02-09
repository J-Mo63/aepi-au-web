class PagesController < ApplicationController
    def landing
    	@blog_posts = policy_scope(BlogPost).order(created_at: :desc)
    end
    
    def about_us
    end

    def contact_us
    end
end
