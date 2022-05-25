class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
def admin?
  has_role?(:admin)
end   

def client?
  has_role?(:client)
end 

  has_many :products, dependent: :destroy
end
