class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    limit(1).order('RANDOM()').first
  end
end
