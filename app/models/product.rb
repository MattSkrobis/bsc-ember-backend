class Product < ApplicationRecord
  include PgSearch
  belongs_to :category
  has_many :pictures
  pg_search_scope :search, :against => :name, :using => {:tsearch => {:prefix => true}}
  pg_search_scope :search_by_color, :against => :color, :ignoring => :accents, :using => {:tsearch => {:prefix => true}}
  pg_search_scope :search_by_category_name, :associated_against => {:category=> :name}, :ignoring => :accents, :using => {:tsearch => {:prefix => true}}
  pg_search_scope :search_by_material, :against => :material, :ignoring => :accents, :using => {:tsearch => {:prefix => true}}
  pg_search_scope :search_by_gender, :against => :gender, :ignoring => :accents, :using => {:tsearch => {:prefix => true}}
  
  def category_name
    category.name 
end
end