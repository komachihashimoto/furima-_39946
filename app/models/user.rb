class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :buy_histories
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :dob, presence: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :last_name, :first_name, format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_furigana, :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
