# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  name: "管理者",
  email: "dore@miru",
  password: "doread",
  )

Category.create!(
  [
    {name: "小説"},
    {name: "マンガ"}
  ]
  )
  
Genre.create!(
  [
    {name: "アクション"},
    {name: "ミステリー"},
    {name: "ファンタジー"},
    {name: "SF"},
    {name: "恋愛"},
    {name: "ホラー・サスペンス"},
    {name: "歴史"},
    {name: "ヒューマン"},
    {name: "コメディ"},
    {name: "学習"}
  ]
  )