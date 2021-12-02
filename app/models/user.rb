class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pingochis, dependent: :destroy
  has_one :wallet, dependent: :destroy
  has_many :inventories, dependent: :destroy
  has_one_attached :photo

  after_create :create_wallet

  def create_wallet
    Wallet.create(user: self)
  end
end
