# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  def characters
    a_id = self.id
    matching_characters = Character.where({ :actor_id => a_id })
    return matching_characters
  end

  def my_director
    dir_id = self.director_id
    matching_directors = Director.where({ :id => dir_id })
    the_director = matching_directors.at(0)
    return the_director
  end

  def my_movie
    m_id = self.movie_id
    matching_movies = Movie.where({ :id => m_id })
    return matching_movies
  end
end
