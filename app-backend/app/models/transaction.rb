class Transaction < ApplicationRecord
  before_create :generate_uuid
  # before_create :check_account_balance

  belongs_to :account
  validates_numericality_of :amount, :greater_than => 0
  validate :check_account_balance
  validates :amount,:account_id, presence: :true


  def to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end

  def check_account_balance
    if account && account.balance < amount
      errors.add(:base, "Not enough money on your account")
    end
  end
end
