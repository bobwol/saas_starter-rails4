# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts 'PLANS'
YAML.load(ENV['PLANS']).each do |plan|
  plan = Plan.find_or_create_by_name plan.titleize
  plan.features = <<-eos
*5* team members
*Digital* recurring billing
*Virtual* online terminal
*10* total products
*1.0%* Transaction fee
  eos
  plan.save
  puts "plan: #{plan.name}"
end

puts "\nADMIN USER"
user = User.find_or_create_by_email email: ENV['ADMIN_EMAIL'].dup, 
  password: ENV['ADMIN_PASSWORD'].dup, 
  password_confirmation: ENV['ADMIN_PASSWORD'].dup, 
  first_name: ENV['ADMIN_FIRST_NAME'].dup, 
  last_name: ENV['ADMIN_LAST_NAME'].dup,
  is_admin: true
puts "admin: #{user.email}"

if Rails.env.development? == true
  puts "\nTEST USER"
  user = User.find_or_create_by_email email: "test-#{ENV['ADMIN_EMAIL']}", 
    password: ENV['ADMIN_PASSWORD'].dup, 
    password_confirmation: ENV['ADMIN_PASSWORD'].dup, 
    first_name: 'Test', 
    last_name: 'User'
  puts "user: #{user.email}"  
  #user.add_role :admin
end
