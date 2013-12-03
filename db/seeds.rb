# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# test
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# admin = User.create({:email => 'cosc617g4sumpin', :first_name => 'Admin', :last_name => 'Marathon', :dob => ['09', '12', '1999'], :password, 'top_secret'})
tempMarathon = Marathon.new({:name => 'Boston', :Date => Time.now, :city => 'Baltimore', :state => 'MD', :country => 'USA', :distance => 26})
tempMarathon.save

tempUser = User.first
UserMarathon.create({:user_id => tempUser.id, :marathon_id => tempMarathon.id, :hours => 6, :minutes => 32, :place => 430})
