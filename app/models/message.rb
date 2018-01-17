class Message < ApplicationRecord
  include PgSearch
  has_many :replies
  pg_search_scope :search, :against => :email, :using => {:tsearch => {:prefix => true}}

  def is_unanswered
    replies.none?
  end
end
