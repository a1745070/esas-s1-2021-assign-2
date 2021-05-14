

describe Movie do

 before :each do
   Movie.create(title: 'Bridgeton', rating: 'G', description: 'Romance', release_date: 1968-04-06, director: 'Chris Vans')
   Movie.create(title: 'Mean Girls', rating: 'PG', description: 'Teenage', release_date: 1981-06-12, director: ' ')
   Movie.create(title: 'Friends', rating: 'PG', description: 'Comedy', release_date: 1950-06-12, director: 'Chris Vans')
   Movie.create(title: 'Alladin', rating: 'G', description: 'Kids', release_date: 2000-06-12, director: 'Chris Vans')
   Movie.create(title: 'Holiday', rating: 'R', description: 'Thriller', release_date: 2019-06-12, director: 'Ridley Hogan')
 
end
 context 'Searching for a movie' do
   it 'should find a movie based on an existing movies director' do
     expect(Movie.find_movie_by_director('Chris Vans').count).to eq(2)
   end 

   it 'should not find movies by different directors' do
     Movie.find_movie_by_director('Chris Vans').each do | movie|
       expect(movie.director).not_to eq('Ridley Hogan')
     end
   end
 end
end