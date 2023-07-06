class Transaction < ApplicationRecord
  before_create :generate_uuid


  belongs_to :account
  validates_numericality_of :amount, :greater_than => 0

  def to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  private

  def generate_uuid
    self.id = SecureRandom.uuid
  end
end
