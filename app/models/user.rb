class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :notes

  after_create :send_welcome_email
  after_create :inform_admin_email

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

  def owner?(content)
    return (content.user_id == id)
  end

  def send_welcome_email
    # UserMailer.delay.user_created(self)
    UserMailer.user_created(self).deliver_now
  end

  def inform_admin_email
    users = User.where(admin: true)
    users.each do |user|
	    # JobMailer.delay.job_created(user, self)
	    UserMailer.user_created_admin_notification(user, self).deliver_now
	  end
  end
end
