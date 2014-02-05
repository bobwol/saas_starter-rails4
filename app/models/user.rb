class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_one :subscription, -> { where('end_date >= ?', Date.today).order("id DESC") }
  has_many :projects, dependent: :destroy
  
  validates :terms_of_service, acceptance: { allow_nil: false, accept: '1' }, on: :create
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def full_name
    [first_name, last_name].join(' ')
  end
end
