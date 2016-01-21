class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :title, length: { 
  	minimum: 1,
  	maximum: 200,
  	too_short: "must have at least %{count} character!",
  	too_long: "must have at most %{count} characters!"
  }

  validates :body, presence: true
end