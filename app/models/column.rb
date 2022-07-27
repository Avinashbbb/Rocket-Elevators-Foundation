class Column < ApplicationRecord
    belongs_to :batterie
    has_one :intervention
    has_many :elevators

end