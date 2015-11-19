class User < ActiveRecord::Base
	has_and_belongs_to_many :trips

	# validates :email,
	# presence: true,
	# uniqueness: {case_sensitive: false},
	# email: true

	# validates :name,
	# length: {minimum: 2},
	# presence: true

	# validates_presence_of :password, on: :create

	has_secure_password
end
