class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validate :is_admin
  validates :email, uniqueness: true
  has_many :codes

  def is_admin
    errors.add(:name, ': 管理者以外は登録できません') if name != ENV['ADMIN_NAME']
  end
end
