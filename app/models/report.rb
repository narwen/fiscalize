class Report < ActiveRecord::Base
  validates_presence_of :title, :description, :lat, :lng
end
