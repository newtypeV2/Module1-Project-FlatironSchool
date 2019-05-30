class Pocketmonster < ActiveRecord::Base
    # has_many :movelists
    # has_many :moves, through: :movelists
    has_many :pocketmonster_trainers
    has_many :trainers, through: :pocketmonster_trainers
end