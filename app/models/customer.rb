class Customer < ApplicationRecord
    has_many :buildings
    has_one :intervention
    belongs_to :user, optional: true
    has_one :addresse
    has_one :lead
end