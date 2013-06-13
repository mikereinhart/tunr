# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :admin
  #in the migration file its called :password_digest
  #here we must call it :password
  #password input is auto-encrypted

  has_and_belongs_to_many :albums

  has_secure_password
end
