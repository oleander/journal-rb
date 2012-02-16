class User < ActiveRecord::Base
  before_create :generate_uuid
  has_many :projects, dependent: :destroy
  has_many :authentications, dependent: :destroy

  def own?(object)
    case object
    when Project
      object.user == self
    else
      raise "I'm not sure what this is"
    end
  end  

private

  def generate_uuid
    self.uuid = UUID.new.generate
  end
end
