class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random
    limit(1).order('RANDOM()').first
  end

  def self.find_by_params(key, value)
    find_by("#{key} = ?", value)
  end

  def self.where_by_params(key, value)
    where("#{key} = ?", value)
  end
end
