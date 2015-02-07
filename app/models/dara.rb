class Dara < ActiveRecord::Base
  mount_uploader :asset, AssetUploader
end
