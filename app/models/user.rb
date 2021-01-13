class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :nickname, presence: true
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/,} do
          validates :first_name
          validates :last_name
        end
        with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/,} do
         validates :first_name_kana
         validates :last_name_kana
        end
         validates :birthday, presence: true
end
