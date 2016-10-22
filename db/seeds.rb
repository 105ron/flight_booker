Airport.create!(name:  "Sydney International", 
								code: "yssy")

Airport.create!(name:  "Perth International",
                code: "YPPH")

Airport.create!(name:  "Cairns International",
                code: "YBCS")

Airport.create!(name:  "Melbourne Airport",
                code: "YMML")

Airport.create!(name:  "Newcastle Airport",
                code: "ywlm")

Airport.create!(name:  "Darwin International",
                code: "YPDN")

Airport.create!(name:  "Adelaide International",
                code: "YPAD")

Airport.create!(name:  "Hobart International",
                code: "YMHB")

Airport.create!(name:  "Canberra Airport",
                code: "YSCB")

Airport.create!(name:  "Richmond Air Base",
                code: "YSRC")


flight_no = 120

4.times do #4 flights a day
	day = 1
	28.times do #4 weekss worth of flights
			(1..10).each do |departure|
				(1..10).each do |destination|
					duration = "#{rand(1..3)}:#{rand(0..59)}:00"
					date = Faker::Time.between((DateTime.now + day), (DateTime.now + day)) 
					if destination != departure
						Flight.create!(number: (120 + flight_no), origin_id: departure, destination_id: destination, datetime: date, duration: duration)
					end
					flight_no += 3
				end
			end
		day += 1
	end
end
