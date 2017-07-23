class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :notes

  def full_name
  	"#{first_name} #{last_name}"
  end

  def admin?
    return admin
  end

  def owner_admin?(content)
    return (admin || content.creator_id == id)
  end

  def owner_admin_for_note?(content)
    return (admin || content.user_id == id)
  end

  def owner_for_note?(content)
    return (content.user_id == id)
  end
end
