class CommentsController < ApplicationController
  def create
    @comment =	Comment.new(post_id: params[:post_id], body: params[:comment][:body], user: current_user )
    @post = @comment.post
    authorize @comment
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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
end
