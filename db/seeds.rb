# Category

Category.destroy_all

category_list = [
  { name: "中式料理"},
  { name: "日本料理"},
  { name: "義大利料理"}
  ]


category_list.each do |category|
  Category.create( name: category[:name])
end

puts "Category created!"


# Default admin

User.create(email: "root@test.com", password: "123456", role: "admin")

puts "Default admin created!"