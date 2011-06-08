class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    
    @game = Game.new
    
    @players = Player.all
    @players.each do |player|
      player[:wins] = Game.where(:winner => player.id).count
      player[:loses] = Game.where(:loser => player.id).count
      player[:played] = player[:wins] + player[:loses]
      
      if player[:wins] > 0 && player[:played] > 0
        ratio = player[:wins]/player[:played].to_f*100
      else
        ratio = 0
      end
      
      # if ratio.nan?
      #   ratio = 0.00
      # else
      #   ratio = (ratio*100).round/100.0
      # end
    
      player[:ratio] = ratio.round
    end
    
    @players.sort! { |a,b| b.ratio <=> a.ratio }
    
    @players.each do |player|
      if player[:ratio] == 0
        player[:ratio] = "-"
      end
    end
    
  end

  def round_to(x)
      (self * 10**x).round.to_f / 10**x
    end
  
end
