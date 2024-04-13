class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        validates :first_name, :email,:last_name, :birthday, :kana_first_name, :kana_last_name, :nickname,  :email, :encrypted_password, presence: true
        validates :email, uniqueness: true
        validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
        validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).*\z/, message: "は半角英数字混合で入力してください" }
        validates :password, confirmation: true
        validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }
        validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください" }

        has_many :items
        has_many :shoppings       

end
