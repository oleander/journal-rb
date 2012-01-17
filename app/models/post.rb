class Post < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :body, :ended_at, :started_at, :project
end
