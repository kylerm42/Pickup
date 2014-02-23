class LocationsController < ApplicationController
  def new_by_ajax
    coords = params[:location]["_json"]
    p params[:location]
    session[:coords] = coords
    render :nothing => true # ajax request will not redirect the user
  end

  def new_by_form
    coords = Geocoder.coordinates(params[:address])

    session[:coords] = coords
    redirect_to root_url # form request will redirect the user
  end

  def set
    render 'set'
  end
end
