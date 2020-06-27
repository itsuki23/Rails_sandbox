class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 20 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :events
  has_many :comments

  has_many :entries
  has_many :favorites

  # 中間テーブルに保存された情報をviewで取得するため、アソシエーションで直接取得（記述の省略）
  has_many :entry_events, through: :entries, source: :event
  has_many :favorite_events, through: :favorites, source: :event  #@user.favorite_events


  has_one_attached :image


  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
