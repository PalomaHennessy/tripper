class Destination < ActiveRecord::Base
	has_and_belongs_to_many :trips

	 validates_presence_of: destination, on: :create
	 validates :url, :url => true 
end
