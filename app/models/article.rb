class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :description, :user_id

  validates_length_of :title, :minimum => 5
end
