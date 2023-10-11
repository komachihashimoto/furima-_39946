class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, :email, :encrypted_password, :password_confirmation, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :dob, presence: true
    validates :email, uniqueness: true
    validates :encrypted_password, length: { minimum: 6 }
    validates :encrypted_password, confirmation: true
    validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :encrypted_password, format: { with: /@/ }
    validates :last_name, :first_name, format: { with:/\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_furigana,:first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
end
