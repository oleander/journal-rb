class User < ActiveRecord::Base
  after_initialize :generate_uuid
  validates_presence_of :name
  has_many :projects
private

  def generate_uuid
    self.uuid = UUID.new.uuid
  end
end
