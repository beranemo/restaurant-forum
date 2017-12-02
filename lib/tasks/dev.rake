namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all
    
    500.times do |i|
      Restaurant.create!(
        name: "restaurant#{i.to_s}",
        opening_hours: "11:00",
        tel: "02-23221122",
        address: "my_address",
        description: "Here is description ")
    end
    
    puts "have create fake restaurants"
    puts "now you have #{Restaurant.count} restaurant data"
    
  end
end