class PocketmonsterTrainer < ActiveRecord::Base
    belongs_to :trainer
    belongs_to :pocketmonster
    has_many :movelists
    has_many :moves , through: :movelists

end