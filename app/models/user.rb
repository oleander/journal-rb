class User < ActiveRecord::Base
  after_initialize :generate_uuid
  has_many :projects
private

  def generate_uuid
    self.uuid = UUID.new.generate
  end
end
