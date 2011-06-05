class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    @players = Player.all
    @players.each do |player|
      player[:wins] = Game.where(:winner => player.id).count
      player[:loses] = Game.where(:player_id => player.id).count + Game.where(:opponent_id => player.id).count - Game.where(:winner => player.id).count
      player[:played] = player[:wins] + player[:loses]
    
      ratio = player[:wins]/player[:played].to_f
      if ratio.nan?
        ratio = 0.0
      end
    
      player[:ratio] = ratio
    end
    
    @players.sort_by { |player| player.ratio }
  end
  

  # 
  # def ratio
  #   wins = Game.where(:winner => id).count
  #   played = Game.where(:player_id => id).count + Game.where(:opponent_id => id).count
  #   ratio = wins/played.to_f
  #   if !ratio.nan?
  #     ratio
  #   else
  #     0.0
  #   end
  # end
  
end
