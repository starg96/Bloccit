class PostsController < ApplicationController

  def index
    @posts = Post.paginate(page: params[:page], per_page: 100)
    authorize @posts
  end

  def show
  	@post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save
      flash[:notice] = "post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. PLease try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:topic).permit(:title, :body)
  end

end