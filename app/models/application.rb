class Application < ApplicationRecord
    
    belongs_to :account
    belongs_to :job

    validates :resume, presence: true
    validates :status, presence: true, inclusion: { in: %w[applied received pending incomplete accepted rejected] }
    validates :account_id, presence: true
    validates :job_id, presence: true

    validates_associated :account

end
