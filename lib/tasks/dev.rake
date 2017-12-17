namespace :dev do
  task fake_restaurants: :environment do
    Restaurant.destroy_all
    
    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
        )
    end
    
    puts "have create fake restaurants"
    puts "now you have #{Restaurant.count} restaurant data"
    
  end
  
  task fake_users: :environment do
    20.times do |i|
      user_name = "user" + i.to_s
      User.create!(
        email: "#{user_name}@xxx.com",
        password: "123456"
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end


  task fake_comments: :environment do
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"
  end
  
end