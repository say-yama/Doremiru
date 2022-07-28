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

User.create!(
  [
    { email: 'aaa@aaa', name: 'あい', password: 'password' },
    { email: 'bbb@bbb', name: 'ボーイ', password: 'password' },
    { email: 'ccc@ccc', name: 'ccc', password: 'password' }, 
    { email: 'ddd@ddd', name: 'ddd', password: 'password' },
    { email: 'eee@eee', name: 'いーね', password: 'password' },
    { email: 'fff@fff', name: 'えふ', password: 'password' },
    { email: 'ggg@ggg', name: 'GG', password: 'password' },
    { email: 'hhh@hhh', name: '栄一', password: 'password' },
    { email: 'iii@iii', name: '私', password: 'password' },
    { email: 'jjj@jjj', name: 'ごはん', password: 'password' },
    { email: 'kkk@kkk', name: 'K', password: 'password' },
  ]
)

Category.create!(
  [
    { name: "小説" },
    { name: "マンガ" },
  ]
)

Genre.create!(
  [
    { name: "アクション" },
    { name: "ミステリー" },
    { name: "ファンタジー" },
    { name: "SF" },
    { name: "恋愛" },
    { name: "ホラー・サスペンス" },
    { name: "歴史" },
    { name: "コメディ" },
    { name: "学習" },
  ]
)
