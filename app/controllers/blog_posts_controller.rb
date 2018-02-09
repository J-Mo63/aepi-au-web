class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  	load_blog_posts
  end

  def new
    build_blog_post
  end

  def edit
  	load_blog_post
  end

  def create
    build_blog_post
    save_blog_post or render 'new'
  end

  def update
    load_blog_post
    update_blog_post or render 'edit'
  end

  def destroy
    load_blog_post
    @blog_post.destroy
    redirect_to root_path
  end

  private

  	def load_blog_posts
  		@blog_posts = policy_scope(BlogPost).order(created_at: :desc)
  	end

  	def load_blog_post
  		@blog_post = BlogPost.find(params[:id])
    	authorize @blog_post
  	end

  	def build_blog_post
			@blog_post = BlogPost.new(blog_post_params)
      authorize @blog_post
		end

		def save_blog_post
			if @blog_post.save
				redirect_to root_path
			end
		end

		def update_blog_post
	    if @blog_post.update(blog_post_params)
				redirect_to root_path
			end
		end

		def blog_post_params
    	blog_post_params = params[:blog_post]
    	blog_post_params ? blog_post_params.permit(:title, :body, :is_published, :image) : {}
    end
end
