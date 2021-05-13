Given /the following movies exist/ do |movies_table|
    movies_table.hashes.each do |movie|
#         Movie.create(movie)
#     end
# end

current_movie = Movie.new
current_movie.title = movie[:title]
current_movie.rating = movie[:rating]
current_movie.release_date = movie[:release_date]
current_movie.save!
end
end

Then /^the director of "(.*)" should be "(.*)"/ do |title, director|
expect(Movie.select('title').where(director: director).first.title).to eq(title)
end