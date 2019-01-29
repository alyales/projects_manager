class Project < ApplicationRecord
	has_many :tasks
	validates :name, :summary, :start_date, presence: true
end
