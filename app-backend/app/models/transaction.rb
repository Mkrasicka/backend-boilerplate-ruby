class Transaction < ApplicationRecord
  belongs_to :account

  def to_s
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
