class AdvertismentController < ApplicationController
  def index
  	@ads = Advertisment.all
  end

  def show
  	@ads = Advertisment.find(params[:id])
  end
end
