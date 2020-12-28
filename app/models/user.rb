class User < ApplicationRecord
  before_save { self.email = email.downcase } 

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true,
                    allow_blank: true

  # has_secure_password
  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  validates :password, length: { minimum: 6, maximum: 12 },
                       format: { with: VALID_PASSWORD_REGEX ,
                      #  message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
                       message: "は半角6~12文字英文字・数字それぞれ１文字以上含む必要があります" },
                       allow_blank: true
  
  validates :phone_number, format: { with: /\A[0-9-]{,14}\z/ }

  enum member_groups: { 正会員: "正会員", 準会員: "準会員" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_without_password(params, *options)
    params.delete(:password)
    params.delete(:password_confirmation)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

end
