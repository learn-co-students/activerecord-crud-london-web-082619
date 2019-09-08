# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes)
  movie.save
  movie
end

def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990}) 
  Movie.create do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
    m.save
  end
end
# This method takes in a hash of attributes. Runs the .create method on the Movie class, and assigns .title attribute to be the title: key from the args hash, and .release_date to to be release_date: key from the hash

def can_get_the_first_item_in_the_database
  Movie.first
end

def can_get_the_last_item_in_the_database
  Movie.last # this, like the above method, uses activerecord's inbuilt methods to call on the first and last entries. In previous labs we have done this with SQL statements calling SELECT
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find_by(id:1)
end
# this just uses the activeRecord method find_by and passes in ID as an argument and hardcodes '1' into the method. This is to satisfy what the test is looking for - this is not currently a dynamic method

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
end
# this is just like the above method, but includes multiple search terms. You just seperate the search values by commas. 

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  Movie.where("release_date > 2002").order(release_date: :desc) 
  # uses .where operator, note that release_date > 2002 is written as a string statement. To order the results in descending order by release date, we use the .order operator and pass into brackets what we want to order it by followed by : and then :desc (would be :asc for ascending))
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  movie = Movie.find_by(title: "Awesome Flick")
  movie.update(title: "Even Awesomer Flick")
  movie.save
  movie
end
# this method finds the movie "Awesome Flick", and assings it to a temporary object, movie. Then it calls .update on that object and in brackets calls on the attribute to update, title:, and offers it the value to update with. Then it calls save, and returns the object.

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  movie = Movie.find_by(title: "Wat?")
  movie.update(title: "Wat, huh?")
  movie.save
  movie
# does literally the same as the earlier method, not sure why this lab test asks for exactly the same thing lol
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.all.each {|movie|movie.update(title: "A Movie")}
  # this method creates the movies first - don't worry about the first part of the method where it was pre-written for you - it is just seeding the database. The bit you wrote is LoC95 - it's iterating over every Movie in the database and calling .update on each one. In parantheses it is doing the same thing as earlier methods you solved in this lab
  # i.e. to call update and then pass in what attribute you are updating, followed by colon, and then the value you want to be applied. 
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  movie = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  movie.delete
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.all.each {|movie| movie.delete}
end
# this does the same as the earlier method 'can_destoy_a_single_item' but just iterates over each movie and deletes each one. Simple! (like some other methods, don't be confused by the first couple of lines of the method where it was pre-written for you and is just seeding the database with movies that you can then delete. I think it is doing
# it like this because there are more than one methods that amend or delete movie entries, so it makes more sense to manually seed per method than reload the console seed data each time you're running these test methods)