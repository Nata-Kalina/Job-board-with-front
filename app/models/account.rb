class Account < ApplicationRecord
    
    belongs_to :user

    validates :first_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }, length: { in: 2..255 }
    validates :last_name, presence: true, format: { with: /\A[a-z\-' ]+\z/i }, length: { in: 2..255 }
    validates :phone, presence: true, numericality: { only_integer: true }, length: { is: 10 }
    validates :user_id, presence: true

    has_many :applications, dependent: :destroy
    
end
