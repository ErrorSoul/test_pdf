class WordAsset < ActiveRecord::Base
  belongs_to :word
  mount_uploader :asset, AssetUploader
end
