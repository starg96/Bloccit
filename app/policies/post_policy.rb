class PostPolicy < ApplicationPolicy


	def index?
		true
	end

	class Scope < Scope
		attr_reader :user, :scope

		def initialize(user, scope)
			@user = user
			@scope = scope
		end

		def resolve
			if  user.admin? || user.moderator?
				scope.all
			elsif user.present?
				scope.where(user_id: user.id) #gives you that users posts
			elsif !user.present?
				scope.where(public: true) #default scope for Post
			end
		end
	end
end