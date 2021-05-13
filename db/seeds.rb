# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
{:title => 'Lion King', :rating => 'R', :release_date => '26-Oct-1984'},
  {:title => 'White Tiger', :rating => 'PG-13', :release_date => '10-Aug-2011'},
  {:title => 'Charlie and the Chocolate Factory', :rating => 'PG-13', :release_date => '5-Jan-2001'},
  {:title => 'Trip to Mars', :rating => 'R', :release_date => '25-Apr-2001'},
  {:title => 'Bridgeton', :rating => 'G', :release_date => '6-Apr-1968'},
  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
  {:title => 'Mean Girls', :rating => 'PG', :release_date => '12-Jun-1981'},
  {:title => 'Yes Day', :rating => 'G', :release_date => '21-Jun-2000'},
  {:title => 'Santa Clarita Diet', :rating => 'G', :release_date => '21-Jun-2000'},
  {:title => 'Harry Potter', :rating => 'G', :release_date => '21-Jun-2000'},
  {:title => 'Love, Rosie', :rating => 'G', :release_date => '21-Jun-2000'},
  {:title => 'Friends', :rating => 'G', :release_date => '21-Jun-2000'}
]

movies.each do |movie|
Movie.create(movie)
end