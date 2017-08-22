class Product < ApplicationRecord
  include PgSearch
  belongs_to :category
  pg_search_scope :search, :against => :name, :using => {:tsearch => {:prefix => true}}
end
