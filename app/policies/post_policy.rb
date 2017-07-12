class PostPolicy < ApplicationPolicy
	attr_reader :user, :post

	class Scope < Scope
		def resolve
			scope.all
		end
	end

	def initialize(user, post)
		@user = user
		@post = post
	end

	def edit?
		user.owner_admin?(@post)
	end

	def update?
		user.owner_admin?(@post)
	end

	def destroy?
		user.owner_admin?(@post)
	end
end
