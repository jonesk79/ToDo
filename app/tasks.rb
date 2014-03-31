class Tasks < ActiveRecord::Base
  validates :name, :presence => true
end
