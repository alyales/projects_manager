class Task < ApplicationRecord
	belongs_to :project
	belongs_to :user
	validates :title, :description, presence: true
	validates :status, :inclusion => {:in => ['new', 'in progress', 'done']}
end
