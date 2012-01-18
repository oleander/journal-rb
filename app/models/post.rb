class Post < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :body, :ended_at, :started_at, :project
  validate :min_post_span, :min_length_body, :positive_time_spam
  
  def diff
    (ended_at.to_i - started_at.to_i) / (60*60)
  end
  
private
  def min_post_span
    if (started_at.to_i - ended_at.to_i).zero?
      self.errors[:ended_at] << "span is too small"
    end
  end
  
  def positive_time_spam
    if (ended_at.to_i - started_at.to_i) < 0
      self.errors[:ended_at] << "can't be negative"
    end
  end
  
  def min_length_body
    if body and body.to_s.length < 10
      self.errors[:body] << "input to small"
    end
  end
end
