class Phara < ActiveRecord::Base
  belongs_to :word
  mount_uploader :avatar, AvatarUploader
end
