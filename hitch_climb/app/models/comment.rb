class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 100 }

  belongs_to :event
  belongs_to :user

  validates :body, length: { in: 1..30 }
  validates :user_id, presence: true
  validates :event_id, presence: true


  def comment_user_image(user)
    if user.image.attached?
      return user.image
    else
      return '/seed/event-default.jpg'
    end
  end

end
