# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
members =
  Member.create(
    [
      {
        name: 'Ahmed Dauda',
        website: 'http://wanda.delivery',
        short_url: 'http://wnd.deliv'
      },
      {
        name: 'Bob Smith',
        website: 'http://google.com',
        short_url: 'http://goo.gl'
      }
    ]
  )
#   Character.create(name: 'Luke', movie: movies.first)
