class Transaction < ApplicationRecord
  belongs_to :account
  validates_numericality_of :amount, :greater_than => 0

  def to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
