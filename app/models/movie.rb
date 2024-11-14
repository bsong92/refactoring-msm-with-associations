# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  has_many(:characters, class_name: "Character", foreign_key: "movie_Id")

  belongs_to(:director, class_name: "Director", foreign_key: "director_id") #-> defining the whole .zebra method 

  has_many(:cast, through: :characters, source: :actor)

  def zebra
    d_id = self.director_id

    mataching_directors = Director.where({ :id => d_id })
  
    the_director = matching_directors.first

    return the_director
  end
end
