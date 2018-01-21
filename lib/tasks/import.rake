require 'csv'
namespace :import do

	desc "Import contacts from CSV"
	task contacts: :environment do

		imports = 0

		CSV.foreach("import.csv", headers: true) do |row|

			uni = row["Uni"]
			if (uni != nil)
				puts uni
				uni_id = Uni.find_by(name: uni.strip).id
			else
				uni_id = nil
			end

			state_id = nil
			status = row["Status"]
			if (status != nil)
				if (status.to_s.to_i == 1)
					state_id = State.find_by(name: "Pledge").id
				elsif (status.to_s.to_i == 2)
					state_id = State.find_by(name: "Deciding on Bid").id
				elsif (status.to_s.to_i == 3)
					state_id = State.find_by(name: "Getting Bid").id
				elsif (status.to_s.to_i == 4)
					state_id = State.find_by(name: "Contacted").id
				elsif (status.to_s.to_i == 5)
					state_id = State.find_by(name: "Uncontacted").id
				elsif (status.to_s.to_i == 6)
					state_id = State.find_by(name: "Not Interested").id
				end
			end

			mobile = row["Mobile"]
			if (mobile != nil)
				mobile = mobile.strip 
			end

			high_school = row["High School"]
			if (high_school != nil)
				high_school = high_school.strip 
			end

			degree = row["Degree"]
			if (degree != nil)
				degree = degree.strip 
			end

			first_name = row["First"]
			if (first_name != nil)
				first_name = first_name.strip 
			end

			last_name = row["Surname"]
			if (last_name != nil)
				last_name = last_name.strip 
			end


			contact = Contact.create(first_name: first_name, last_name: last_name, mobile: mobile, uni_id: uni_id, state_id: state_id, added_by: User.first.id, high_school: high_school, degree: degree, is_brother: false)

			puts "Contact #{first_name} #{last_name} - #{contact.errors.full_messages}" if contact.errors.any?

			imports += 1 if contact.persisted?
		end

		puts "Imported #{imports} contacts"
	end
end