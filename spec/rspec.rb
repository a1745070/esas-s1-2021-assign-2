def "GET new" do
    it "assigns a new movie as @movie" do
    get :new
      assigns(:movie).should be a new(Movie)
end
end

 def "GET show" do
       it "assigns the movie as @movie" do
       movie = Movie.create! 
        get :show, :id => movie.id
         assigns(:movie).should eq(movie)
       end
     end
    
     