class StaticPagesController < ApplicationController
  def index
    render 'home'
  end

  def login
    render 'login'
  end
end
