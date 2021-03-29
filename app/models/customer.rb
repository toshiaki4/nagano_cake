class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def full_name
    # 三項演算子
    first_name = self.first_name ? self.first_name : ""
    last_name = self.last_name ? self.last_name : ""
  
    last_name + first_name
  end
end
