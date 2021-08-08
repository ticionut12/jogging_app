class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jogging_times

  def user_manager?
      'user_manager' == self.role
  end
  def admin_user?
      'admin_user' == self.role
  end
  
end

