class Post < ActiveRecord::Base

  validates :text1, :text2, :text3, :text4, presence: true
  validates :text5, :text6, :text7, :text8, presence: true
  validates :text9, :text10, presence: true
end
