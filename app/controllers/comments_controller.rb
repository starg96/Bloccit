class CommentsController < ApplicationController
  def create
    @comment =	Comment.new(post_id: params[:post_id], body: params[:comment][:body], user: current_user )
    @post = @comment.post
    authorize @comment

    if @comment.save
      flash[:notice] = "comment was saved."
      redirect_to [@comment.post.topic, @comment.post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end
  end

  def destroy

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@comment.post.topic, @comment.post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@comment.post.topic, @comment.post]
    end
  end
end
