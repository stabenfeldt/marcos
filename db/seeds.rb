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


Part.create(brand: 'SRAM', model: '11-Speed', kind: 'chain', service_interval: 200)
Part.create(brand: 'FSA',
            model: 'FSA Orbit 1.5B ZS-1, Semi-Integrated, Top 1 1/8" Bottom 1 1/2"',
            kind: 'headset', service_interval: 5000)
Part.create(brand: 'SRAM', model: 'X1 Type2, 11-Speed', kind: 'rear derailleur',
            service_interval: 5000)
Part.create(brand: 'Fox', model: 'RP 2 BSD LV air sleeve', kind: 'rear shock',
            service_interval: 3000)

# Generic parts
Part.create(brand: 'generic', model: 'generic', kind: 'rear shock',
            service_interval: 3000, note: 'Rear shocks need new oil every 3000 km')

Part.create(brand: 'generic', model: 'generic', kind: 'cassette',
            service_interval: 3000, note: '')
Part.create(brand: 'generic', model: 'generic', kind: 'chain',
            service_interval: 3000, note: 'Change if streched longer thatn 0.5')
Part.create(brand: 'generic', model: 'generic', kind: 'front break',
            service_interval: 3000, note: '')
Part.create(brand: 'generic', model: 'generic', kind: 'front derailleur',
            service_interval: 1000, note: '')
Part.create(brand: 'generic', model: 'generic', kind: 'headset',
            service_interval: 3000, note: 'Greece and look for rust')
Part.create(brand: 'generic', model: 'generic', kind: 'rear break',
            service_interval: 1000, note: 'Change break pads')
Part.create(brand: 'generic', model: 'generic', kind: 'rear derailleur',
            service_interval: 3000, note: 'Change break pads')
Part.create(brand: 'generic', model: 'generic', kind: 'rear shock',
            service_interval: 1000, note: 'Oil')
Part.create(brand: 'generic', model: 'generic', kind: 'shifters',
            service_interval: 4000, note: '')
Part.create(brand: 'generic', model: 'generic', kind: 'suspension fork',
            service_interval: 3000, note: 'Oil')
