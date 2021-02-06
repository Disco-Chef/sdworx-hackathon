class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  def allies
    allies = []

    current_user.team.users.each do |user|
      allies << user.profile
    end

    return allies
  end
end
