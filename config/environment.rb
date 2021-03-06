require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

require_relative '../app/models/errors.rb'
require_relative '../app/models/board.rb'
require_relative '../app/models/move.rb'
require_relative '../app/models/player.rb'
require_relative '../app/models/clirunner.rb'
