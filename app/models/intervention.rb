class Intervention < ApplicationRecord
    belongs_to :column
    belongs_to :customer
    belongs_to :building 
    belongs_to :batterie
    belongs_to :employee
    belongs_to :elevator
end
