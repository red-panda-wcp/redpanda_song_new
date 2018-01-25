class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :carts

def active_for_authentication?
  # ユーザーの論理削除時（self.active == 0)と、devise初期値の状況の場合にログイン許可する
  super and self.active == 0
end

def inactive_message
  # ユーザーの論理削除時にflashへエラーメッセージを格納する
  self.active == 0 ? super : :status_disabled
end

end
