require 'active_record'
require 'yaml'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class ClawlGithubRepository < ActiveRecord::Base
  def self.update_duplicate
    create_table :on_duplicates do |t|
    end
  end
end
