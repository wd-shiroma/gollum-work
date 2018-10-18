require 'active_record'

script_path = File.expand_path(File.dirname(__FILE__))

config = {
  :adapter  => "sqlite3",
  :database => "#{script_path}/stored.db"
}

ActiveRecord::Base.establish_connection(config)

class Instance < ActiveRecord::Base
end

