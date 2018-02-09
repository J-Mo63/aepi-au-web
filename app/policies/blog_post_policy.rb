class BlogPostPolicy < ApplicationPolicy
	attr_reader :user, :blog_post

  class Scope < Scope
    def resolve
    	if @user != nil && @user.admin
    		scope.all
    	else
      	scope.where(is_published: true)
      end
    end
  end

  def initialize(user, blog_post)
		@user = user
		@blog_post = blog_post
	end

	def index?
		true
	end

	def new?
		@user.admin
	end

	def create?
		@user.admin
	end

	def edit?
		@user.admin
	end

	def update?
		@user.admin
	end

	def destroy?
		@user.admin?
	end
end