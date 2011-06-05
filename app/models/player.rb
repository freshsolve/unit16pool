class Player < ActiveRecord::Base

  has_many :games
  
  def wins
      Game.where(:winner => id).count
    end

    def loses
      Game.where(:player_id => id).count + Game.where(:opponent_id => id).count - Game.where(:winner => id).count
    end

    def played
      Game.where(:player_id => id).count + Game.where(:opponent_id => id).count
    end

    def ratio
      wins = Game.where(:winner => id).count
      played = Game.where(:player_id => id).count + Game.where(:opponent_id => id).count
      ratio = wins/played.to_f
      if !ratio.nan?
        ratio
      else
        0.0
      end
    end

end
