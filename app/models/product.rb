class Product < ApplicationRecord
  include PgSearch
  belongs_to :category
  has_many :pictures
  pg_search_scope :search, :against => :name, :using => {:tsearch => {:prefix => true}}
end
