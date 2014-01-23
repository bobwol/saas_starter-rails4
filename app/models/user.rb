class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_one :current_subscription, -> { where 'end_date >= ?', Date.today }, class_name: 'Subscription'
  
  validates :terms_of_service, acceptance: { allow_nil: false }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def name
    [first_name, last_name].join(' ')
  end
end
