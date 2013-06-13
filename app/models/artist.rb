# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_url    :string(255)
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :img_url

  has_many :songs
  has_many :albums, :through => :songs
end
