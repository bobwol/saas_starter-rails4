# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts 'PLANS'
plan = Plan.find_or_create_by_name 'Basic'
plan.price = 0
plan.features = <<-eos
*5* team members
*Digital* recurring billing
*Virtual* online terminal
*10* total products
*1.0%* Transaction fee
eos
plan.is_featured = false
plan.has_trial = false
plan.save
puts "plan: #{plan.name}"

plan = Plan.find_or_create_by_name 'Advanced'
plan.price = 5
plan.features = <<-eos
*10* team members
*Digital* recurring billing
*Virtual* online terminal
*20* total products
*0.75%* Transaction fee
eos
plan.is_featured = true
plan.has_trial = true
plan.save
puts "plan: #{plan.name}"

plan = Plan.find_or_create_by_name 'Deluxe'
plan.price = 10
plan.features = <<-eos
*15* team members
*Digital* recurring billing
*Virtual* online terminal
*30* total products
*0.5%* Transaction fee
eos
plan.is_featured = false
plan.has_trial = false
plan.save
puts "plan: #{plan.name}"

puts "\nADMIN USER"
user = User.find_or_create_by_email email: ENV['ADMIN_EMAIL'].dup, 
  password: ENV['ADMIN_PASSWORD'].dup, 
  password_confirmation: ENV['ADMIN_PASSWORD'].dup, 
  first_name: ENV['ADMIN_FIRST_NAME'].dup, 
  last_name: ENV['ADMIN_LAST_NAME'].dup,
  is_admin: true,
  terms_of_service: 1
puts "admin: #{user.email}"

if Rails.env.development? == true
  puts "\nTEST USER"
  user = User.find_or_create_by_email email: "test-#{ENV['ADMIN_EMAIL']}", 
    password: ENV['ADMIN_PASSWORD'].dup, 
    password_confirmation: ENV['ADMIN_PASSWORD'].dup, 
    first_name: 'Test', 
    last_name: 'User',
    terms_of_service: 1
  puts "user: #{user.email}"  
  user.subscriptions.new(plan: Plan.first)
end
