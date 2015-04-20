class QuestionsController < ApplicationController
  def index
  	@quests = Question.all
  end

  def show
  	@quest = Question.find(params[:id])
  end

  def new
  	@quest = Question.new
  end

  def create
  	@quest = Question.new(params.require(:question).permit(:title, :body, :resolved))
  	if @quest.save
  		flash[:notice] = "Question was saved."
  		redirect_to @quest
  	else
  		flash[:error] = "There was an error saving the Question. Please try again."
  		render :new
  	end
  end

  def edit
  	@quest = Question.find(params[:id])
  end

  def update
  	@quest = Question.find(params[:id])
  	if @quest.update_attributes(params.require(:question).permit(:title, :body))
  		flash[:notice] = "Question was updated."
  		redirect_to @quest
  	else
  		flash[:error] = "There was an error saving the question. Please try again."
  		render :edit
  	end
  end


  def destroy
    @quest = Question.find(params[:id])

    if @quest.delete
      flash[:notice] = "Question was deleted."
    else
      flash[:error] = "There was an error deleting the question. Please try again."
    end

    redirect_to :index
  end
end
