class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  #\Aで^と, \zで$と同じ意味 /iで大文字小文字無視
  validates :email, presence:true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX} , uniqueness: {case_sensitive: false}
  has_secure_password
  #年齢は任意入力、0歳以上100歳以下、数字とする
  validates :age, presence:false,numericality: {only_integer:true, greater_than_or_equal_to: 0,less_than: 100}, on: :update
  #一言は入力任意、2文字以上100文字以内とする
  validates :phrase, presence:false, length:{ maximum:100, minimum:0}, on: :update
end
