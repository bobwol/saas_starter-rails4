class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  
  validates_presence_of :user_id
  validates_presence_of :plan_id
  
end
