class Move < ActiveRecord::Base
    has_many :movelists
    has_many :pocketmonster_trainers, through: :movelists
end