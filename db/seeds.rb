# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Player.create(:name => 'Chris', :twitter => 'chrisrowe')
Player.create(:name => 'Nat', :twitter => 'nfourtythree')
Player.create(:name => 'Jake', :twitter => 'jse247')

Game.create(:winner => 1, :loser => 2)
Game.create(:winner => 1, :loser => 3)
Game.create(:winner => 1, :loser => 2)
Game.create(:winner => 1, :loser => 3)