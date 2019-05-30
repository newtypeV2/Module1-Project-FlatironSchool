require 'bundler/setup'
require 'rake'
require 'active_record'
require 'tty-prompt'
require_relative '../lib/pocketmonster.rb'
require_relative '../lib/move.rb'
require_relative '../lib/movelist.rb'
require_relative '../lib/UI.rb'
require_relative '../lib/trainer.rb'
require_relative '../lib/pocketmonster.rb'
require_relative '../lib/pocketmonster_trainer.rb'
Bundler.require
 



ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "./db/pocketmonster.db"
  )

# put the code to connect to the database here

# ActiveRecord::Base.logger = Logger.new(STDOUT)
