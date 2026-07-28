class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  FULL_WIDTH_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥ー]+\z/
  FULL_WIDTH_KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: FULL_WIDTH_NAME_REGEX, message: "は全角文字で入力してください", allow_blank: true }
  validates :first_name, presence: true, format: { with: FULL_WIDTH_NAME_REGEX, message: "は全角文字で入力してください", allow_blank: true }
  validates :last_name_kana, presence: true, format: { with: FULL_WIDTH_KATAKANA_REGEX, message: "は全角カタカナで入力してください", allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: FULL_WIDTH_KATAKANA_REGEX, message: "は全角カタカナで入力してください", allow_blank: true }
  validates :birth_date, presence: true
  validates :password, format: { with: PASSWORD_REGEX, message: "は半角英数字混合で入力してください", allow_blank: true }
end
