class HelloWorldController < ApplicationController
  def index
    return render json:'Bienvenue sur BlockCovid'
  end
end
