class CommentsController < ApplicationController
  def create
    @comment =	Comment.new(post_id: params[:post_id], body: params[:comment][:body], user: current_user )
    @post = @comment.post
    # We want a comment attached to a post and a user when we are done here.
    # @comment = current_user.comments.build(params.require(:comment).permit(:title, :body))

    if @comment.save
      flash[:notice] = "comment was saved."
      redirect_to [@comment.post.topic, @comment.post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end
  end
end
