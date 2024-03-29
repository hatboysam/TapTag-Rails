namespace :db do
	desc "Populate with Test Data"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		@mycompany = Company.find(1)

		[Vendor, User, Reward, Tap].each(&:delete_all)
		ActiveRecord::Base.connection.execute('ALTER SEQUENCE vendors_id_seq RESTART WITH 1')
		ActiveRecord::Base.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
		ActiveRecord::Base.connection.execute('ALTER SEQUENCE rewards_id_seq RESTART WITH 1')
		ActiveRecord::Base.connection.execute('ALTER SEQUENCE taps_id_seq RESTART WITH 1')


		Vendor.populate 40 do |vendor|
			vendor.company_id = 1
			vendor.name = Faker::Company.name
			vendor.address1 = Faker::Address.street_address
			vendor.address2 = ""
			vendor.city = Faker::Address.city
			vendor.state = Faker::Address.us_state_abbr
			vendor.zip = 10000..99999
			vendor.lat = 24..49
			vendor.lng = -124..-66
		end

		User.populate 200 do |user|
			user.first = Faker::Name.first_name
			user.last = Faker::Name.last_name
			user.email = Faker::Internet.email
		end

		Reward.populate 10 do |reward|
			reward.start_date = (Date.today - 1.years)..Date.today
			reward.end_date = (Date.today - 6.months)..(Date.today + 1.years)
			reward.actions_needed = 5..20
			reward.repeats = [true, false]
			reward.company_id = 1
			reward.name = Faker::Company.bs.titleize
			reward.description = Faker::Company.catch_phrase
		end

		@userids = User.all.map(&:id)
		@vendorids = Vendor.all.map(&:id)

		Tap.populate 1500 do |tap|
			tap.vendor_id = @vendorids
			tap.company_id = 1
			tap.user_id = @userids
			tap.tapped_time = (DateTime.now - 1.years)..DateTime.now
			tap.tapped_date = tap.tapped_time.to_date
		end
	end
end