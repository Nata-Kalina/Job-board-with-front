class Job < ApplicationRecord

    belongs_to :company

    validates :title, presence: true, length: {maximum: 50}
    validates :description, presence: true
    validates :application_deadline, presence: true
    validates :requirements, presence: true
    validates :responsibilities, presence: true
    validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :company_id, presence: true

    validates_associated :company
    
    has_many :applications, dependent: :destroy

end
