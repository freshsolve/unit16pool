class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    @players = Player.all
  end
  
end
