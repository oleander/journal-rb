class User < ActiveRecord::Base
  before_create :generate_uuid
  has_many :projects, dependent: :destroy
  has_many :authentications, dependent: :destroy
  
private

  def generate_uuid
    self.uuid = UUID.new.generate
  end
end
