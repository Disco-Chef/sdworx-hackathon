class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_one :profile
  before_validation :assign_company
  has_many :memberships
  has_many :teams, through: :memberships

  private

  def assign_company
    self.company ||= Company.last
  end
end
