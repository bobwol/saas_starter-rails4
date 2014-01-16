# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#puts 'DEFAULT ROLES'
#Role.find_or_create_by_name({ :name => user }, :without_protection => true)
#puts 'role: admin'
#Role.find_or_create_by_name({ :name => admin }, :without_protection => true)
#puts 'role: user'

#puts 'CUSTOM ROLES'
#YAML.load(ENV['PLANS']).each do |plan|
#  Role.find_or_create_by_name({ :name => plan }, :without_protection => true)
#  puts 'role: ' << plan
#end

puts 'ADMIN USER'
user = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, 
  :password => ENV['ADMIN_PASSWORD'].dup, 
  :password_confirmation => ENV['ADMIN_PASSWORD'].dup, 
  :first_name => ENV['ADMIN_FIRST_NAME'].dup, 
  :last_name => ENV['ADMIN_LAST_NAME'].dup
puts 'user: ' << user.email
#user.add_role :admin
