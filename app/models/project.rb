class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  validates_presence_of :user
end
