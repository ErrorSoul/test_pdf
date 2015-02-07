class Word < ActiveRecord::Base
  has_many :word_assets, inverse_of: :word, :dependent => :destroy
  accepts_nested_attributes_for :word_assets
end
