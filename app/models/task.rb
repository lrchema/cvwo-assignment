class Task < ApplicationRecord
	belongs_to :type
	belongs_to :status
	belongs_to :priority
	validates :title, presence: true, length: { maximum: 50 }
	validates :start, presence: true
	validates :due_date, presence: true, if: :date_valid?

	def date_valid?
		if due_date < start
    		errors.add(:due_date, "must be after the start date")
    	end
    	if start < Date.today
    		errors.add(:start, "must not be in the past")
  		end 
	end
end
