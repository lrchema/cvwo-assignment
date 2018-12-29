class Task < ApplicationRecord
	belongs_to :type
	belongs_to :status
	belongs_to :priority
end
