# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_url    :string(255)
#

class Album < ActiveRecord::Base
  attr_accessible :name, :img_url

  has_many :songs
  has_many :artists, :through => :songs
  has_and_belongs_to_many :users
end
