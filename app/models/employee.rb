class Employee < ApplicationRecord
    belongs_to :user, optional: true
    has_one :intervention
    has_many :buildings
end