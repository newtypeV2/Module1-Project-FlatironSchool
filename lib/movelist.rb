class Movelist < ActiveRecord::Base
    belongs_to :pocketmonster_trainer
    belongs_to :move
end