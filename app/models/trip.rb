class Trip < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :destinations
  
  validates_presence_of :start_point, on: :create
  validates_presence_of :end_point, on: :create
  validates_presence_of :trip_name, on: :create


end
