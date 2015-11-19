class Destination < ActiveRecord::Base
	has_and_belongs_to_many :trips

	 validates_presence_of :place, on: :create
	 validates :url, :url => true 
end
