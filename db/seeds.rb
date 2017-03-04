# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "自动向数据库增加商品"

Product.delete_all

qualitys = ['九五品','九品','八五品','八品','七五品','几乎全新']

require 'csv'
csv = CSV.read('/Users/zhumeijuan/railsbridge/temp/books.csv', :headers => true)
csv.each do |row|
  if row['title'].present?
    # title,
    #   writer,
    #   publisher,
    #   imageurl,
    #   commenttitle = [row['title'],
    #       row['writer'],
    #       row['publisher'],
    #       row['imageurl'],
    #       row['commenttitle']].map(&:to_s)
    Product.create({
      :title => row['title'],
      :writer => row['writer'],
      :publisher => row['publisher'],
      :quality => qualitys[rand(qualitys.length)],
      :price => rand(30),
      :stock => 1,
      :is_hidden => false,
      :coment_title => row['commenttitle'],
      :description => row['comment']
    })
  end
end

puts "商品添加完成！"

User.create(email: "may@126.com", password: "123456", password_confirmation: "123456", is_admin: true)

User.create(email: "titi@123.com", password: "123456", password_confirmation: "123456", is_admin: false)

puts "用户添加完成！"
