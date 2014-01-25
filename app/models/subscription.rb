class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  
  default_scope order: 'end_date DESC'
  default_scope order: 'id DESC'

  validates_presence_of :user_id
  validates_presence_of :plan_id
  
  attr_accessor :stripe_card_token
end
