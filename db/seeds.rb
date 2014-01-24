# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts 'PLANS'
Plan.find_or_create_by(name: 'Basic') do |p|
  p.price = 0
  p.features = <<-eos
*5* team members
*Digital* recurring billing
*Virtual* online terminal
*10* total products
*1.0%* Transaction fee
eos
  p.is_featured = false
  p.has_trial = false
  
  puts "plan: #{p.name}"
end

Plan.find_or_create_by(name: 'Advanced') do |p|
  p.price = 5
  p.features = <<-eos
*10* team members
*Digital* recurring billing
*Virtual* online terminal
*20* total products
*0.75%* Transaction fee
eos
  p.is_featured = true
  p.has_trial = true
  
  puts "plan: #{p.name}"
end

Plan.find_or_create_by(name: 'Deluxe') do |p|
  p.price = 10
  p.features = <<-eos
*15* team members
*Digital* recurring billing
*Virtual* online terminal
*30* total products
*0.5%* Transaction fee
eos
  p.is_featured = false
  p.has_trial = false

  puts "plan: #{p.name}"
end

puts "\nADMIN USER"
User.find_or_create_by(email: ENV['ADMIN_EMAIL'].dup) do |u|
  u.password = ENV['ADMIN_PASSWORD'].dup
  u.password_confirmation = ENV['ADMIN_PASSWORD'].dup
  u.first_name = ENV['ADMIN_FIRST_NAME'].dup
  u.last_name = ENV['ADMIN_LAST_NAME'].dup
  u.is_admin = true
  u.terms_of_service = 1
  
  puts "admin: #{u.email}"
end

if Rails.env.development? == true
  puts "\nTEST USER"
  user = User.find_or_create_by(email: "test-#{ENV['ADMIN_EMAIL']}") do |u|
    u.password = ENV['ADMIN_PASSWORD'].dup
    u.password_confirmation = ENV['ADMIN_PASSWORD'].dup
    u.first_name = 'Test'
    u.last_name = 'User'
    u.terms_of_service = 1
        
    puts "user: #{u.email}"  
  end
  
  user.subscriptions.create(plan: Plan.first)
end
