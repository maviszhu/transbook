# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "自动向数据库增加商品"

Product.destroy_all

qualitys = ['九五品','九品','八五品','八品','七五品','几乎全新']

require 'csv'
require 'open-uri'
csv = CSV.read('books.csv', :headers => true)
csv.each do |row|
  if row['title'].present?
    booktitle = row['title']
    Product.create({
      :title => row['title'],
      :writer => row['writer'],
      :publisher => row['publisher'],
      :quality => qualitys[rand(qualitys.length)],
      :price => rand(20)+10,
      :stock => 1,
      :is_hidden => false,
      image: open(File.join('http://om6rf40s7.bkt.clouddn.com', URI::encode(booktitle)+'.png')),
      bg_image: open(File.join('http://om6rf40s7.bkt.clouddn.com', URI::encode(booktitle)+'2.jpg')),
      :comment_user => row['user'],
      :coment_title => row['commenttitle'],
      :description => row['comment']
    })
  end
end
puts "商品添加完成！"

User.create(email: "may@126.com", password: "123456", password_confirmation: "123456", is_admin: true)

User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", is_admin: false)

http://om6rf40s7.bkt.clouddn.com/uploads/product/bg_image/1/%E5%B0%8F%E9%A1%BE%E8%81%8A%E7%BB%98%E7%94%BB2.jpg
puts "用户添加完成！"
