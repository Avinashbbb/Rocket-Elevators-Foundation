class Lead < ApplicationRecord
    has_one :user, foreign_key: true
end
