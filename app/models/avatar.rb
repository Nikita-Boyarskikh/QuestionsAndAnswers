class Avatar < ApplicationRecord
  resourcify
  mount_uploader :body, AvatarUploader
  belongs_to :user, touch: true, optional: true
  validates :body, file_size: { less_than: 2.megabytes },
                   file_content_type: { allow: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
end
