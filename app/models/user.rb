class User < ActiveRecord::Base
  has_many :subscriptions
  
  #<div class="checkbox">
  #  <%= f.check_box :terms_of_service %>
  #  <%= f.label :terms_of_service, "Yes, I have read and accept the #{link_to 'terms of service', page_path('tos'), target: '_blank'} agreement.".html_safe %>
  #</div>
  #validates :terms_of_service, acceptance: { allow_nil: false }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def name
    [first_name, last_name].join(' ')
  end
end
