class BusinessesController < ApplicationController

  def index
    if params[:distance]
      @businesses = Business.search(params[:distance]).records
    else
      @businesses = Business.all
    end
  end

end