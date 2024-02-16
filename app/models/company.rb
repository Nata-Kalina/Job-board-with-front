class Company < ApplicationRecord
    
    belongs_to :user

    validates :title, presence: true
    validates :about, presence: true
    validates :industry, presence: true
    validates :website, presence: true
    validates :email, email: true
    validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }
    validates :linkedin, presence: true
    validates :user_id, presence: true

    has_many :jobs, dependent: :destroy

end
