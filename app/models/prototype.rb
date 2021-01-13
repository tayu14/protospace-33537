class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # dependent: :destroy　はこれもついでに消すよってコード上の場合だとツイートについてるコメントも消してくれる。ユーザにもつけていたらユーザーの垢も消えてしまう
  has_one_attached :image
  
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
