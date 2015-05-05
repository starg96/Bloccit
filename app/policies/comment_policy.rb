class CommentPolicy < ApplicationPolicy

	def new?
		true
	end

	def create?
		user.present?

	end
end