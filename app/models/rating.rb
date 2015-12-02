class Rating < ActiveRecord::Base
  has_many :topics, through: :rates, source: :ratable, source_type: :Topic
  has_many :posts, through: :rates, source: :ratable, source_type: :Post
  has_many :rates

  def self.update_ratings(rating_string)
    Rating.find_or_create_by(severity: rating_string.to_i)
  end


  enum severity: [:PG, :PG13, :R]
end
