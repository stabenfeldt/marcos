# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Product.destroy_all
Product.create(
  name: 'Gull',
  description: 'Sykkelen er ferdig i løpet av 12 timer.' +
               'Vi henter og bringer sykkelen til der du er.' +
               'Bikefitting. Unngå slitasjeskader og få mer ut av sykkelen med spesialtilpassing.'
  )

Product.create(
  name: 'Sølv',
  description: 'Sykkelen er ferdig i løpet av 12 timer.' +
               'Vi henter og bringer sykkelen til der du er.' +
               'Bikefitting. Unngå slitasjeskader og få mer ut av sykkelen med spesialtilpassing.'
  )

Product.create(
  name: 'Diamant',
  description: 'Sykkelen er ferdig i løpet av 12 timer.' +
               'Vi henter og bringer sykkelen til der du er.' +
               'Bikefitting. Unngå slitasjeskader og få mer ut av sykkelen med spesialtilpassing.'
  )

