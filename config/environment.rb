require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

require_relative '../app/models/board.rb'
require_relative '../app/models/move.rb'
require_relative '../app/models/player.rb'
