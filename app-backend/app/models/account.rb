class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :transaction_requests, dependent: :destroy
end
