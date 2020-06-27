class Event < ApplicationRecord

  validates :head, presence: true, length: { in: 1..50 }
  #validates :head, length: { in: 1..50 }
  validates :body, presence: true, length: { in: 1..500 }
  #validates :body, length: { in: 1..500 }
  #validates :user_id, presence: true => error バリデーションに失敗しました：userを入力してくださいが！！

  belongs_to :user, optional: true

  has_many  :favorites
  has_many  :comments
  has_many  :entries

  has_one_attached :image

  def favorite_yet?(user)
    favorites.where(user_id: user.id).empty?
  end

  def entry_yet?(user)
    entries.where(user_id: user.id).empty?
  end

  def event_image(event)
    if event.image.attached?
      return event.image
    else
      return '/seed/event-default.jpg'
    end
  end

  def event_organizer_image(user)
    if user.image.attached?
      return user.image
    else
      return '/seed/user-default.png'
    end
  end

end

