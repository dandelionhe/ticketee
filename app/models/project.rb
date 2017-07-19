class Project < ApplicationRecord
	validates :name,presence:true
	has_many :tickets,dependent: :delete_all
	has_many :roles,dependent: :delete_all
end
