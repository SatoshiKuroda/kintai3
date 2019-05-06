class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :recoverable, :rememberable, :validatable
  enum role: { admin: 1, manager: 2, hoge_staff: 3 }
end
