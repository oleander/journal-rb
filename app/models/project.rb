class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  #validates_presence_of :user
  #validates_uniqueness_of :name
  
  def to_param
    "#{id}-#{name.to_s.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end
