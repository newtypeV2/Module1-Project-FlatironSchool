class Trainer < ActiveRecord::Base
     has_many :pocketmonster_trainers
     has_many :pocketmonsters, through: :pocketmonster_trainers
end