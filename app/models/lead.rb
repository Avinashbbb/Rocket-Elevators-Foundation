class Lead < ApplicationRecord
    has_one :user, foreign_key: true
    belongs_to :customer, optional: true
    mount_uploader :file, FileUploader
end
