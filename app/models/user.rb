class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true, format: { with: /\Atomo\z/, message: '管理者以外は登録できません' }
  validates :email, uniqueness: true
  has_many :codes
end
