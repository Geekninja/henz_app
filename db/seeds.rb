# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({
    email: 'dev@dev.com',
    password: '123456789',
    password_confirmation: '123456789',
    name: 'dev'
})

SupplierCategory.create({
  name: "Posto de abastecimento",
  status: true,
  protected: true,
  code: "posto_abastecimento"
})