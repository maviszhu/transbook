# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "自动向数据库增加10条测试商品"
puts "Product，当前字段：title，description，price，stock，is_hidden"

titles = ["人月神话 40周年中文纪念版","你只是看起来很努力","站在两个世界的边缘","礼物","异类：不一样的成功启示录",
  "少有人走的路","这一生，静待时光检验","谁说菜鸟不会数据分析","经济学","影响力"]

Product.delete_all
(1..10).each do |i|
  Product.create(title: titles[i-1], description:"等待添加商品描述", price: rand(500), stock: 1, is_hidden:"false")
end

puts "商品添加完成！"

User.create(email: "may@126.com", password: "123456", password_confirmation: "123456", is_admin: true)

User.create(email: "titi@123.com", password: "123456", password_confirmation: "123456", is_admin: false)

puts "用户添加完成！"
