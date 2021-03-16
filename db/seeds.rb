# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Language.create [{ name: 'Ruby' },
                 { name: 'Rust' },
                 { name: 'Vue' },
                 { name: 'Elixir' },
                 { name: 'C#' }]


# response = HTTParty.get('http://api.github.com/search/repositories?q=language%3Aruby&sort=stars&order=desc&per_page=1')
# puts response
#
# Repository.create(
#     name: response.body.name,
#     owner_name: response.body.owner.login,
#     owner_avatar: response.body.owner.avatar_url,
#     description: response.body.description,
#
#     )
#
