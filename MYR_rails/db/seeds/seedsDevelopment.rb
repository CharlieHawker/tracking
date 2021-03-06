# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#http://stackoverflow.com/questions/10301794/difference-between-rake-dbmigrate-dbreset-and-dbschemaload

#final markers
#60,10500, 19,95000
#60,10800, 19,95000
#60,10800, 19,95600
#60,10500, 19,95600

# case RAILS.env

# when "development"

# #SEEDS for development and test environment
# #specify rake db:reset RAILS_ENV=development to be sure you load them correctly

Member.create!(name:  "testAdmin",
               email: "example@gmail.com",
               password:              "foobar",
               password_confirmation: "foobar",
               role:     'administrator',
               activated: true,
               activated_at: Time.zone.now)

Mission.create!(name:  "area scanning",
			start: "20150601000000",
			end:   "20150901000000",
     		mtype: "AreaScanning",
			edition_id: 1,
			category: "Sailboat")

i=1
20.times do |n|
	token=i
	Tracker.create!(token:  "#{i}",
             		  description: "It was the #{i} tracker.")
  i=i+1
end

Edition.create!(name: "testEdition")

#============= test triangular scores ==============
5.times do |n|
#id=2-4
	 Member.create!(name:  "testTriangular#{n}",
               email: "testTriangular@gmail.com",
               password:              "123456",
               password_confirmation: "123456",
               role:     'competitor',
               activated: true,
               activated_at: Time.zone.now,
               team_id: n+1)
#id=1-2		
	Team.create!(name:  "testTriangular#{n}'s team",
           description: "root test for triangular",
           leader_id: 2+n)
	Robot.create!(name:  "triangular#{n}'s sailrobot",
              category: "Sailboat",
              team_id: 1+n)
	2.times do |m|
		Attempt.create!(name: "triangular#{n}'s attempt",
								start: "20150601000000",
								end: "20150901000000",
								robot_id: 1+2*n,
								mission_id: 1,
								tracker_id: 1+n*2)
	end

	Robot.create!(name:  "triangular#{n}'s microsailrobot",
              category: "MicroSailboat",
              team_id: 1+n)

	2.times do |m|
		Attempt.create!(name: "triangular#{n}'s micro attempt",
								start: "20150601000000",
								end: "20150901000000",
								robot_id: 2+2*n,
								mission_id: 1,
								tracker_id: n*2+2)

	end
end
