# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  company_name    :string
#  description     :text
#  email           :string
#  full_name       :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :integer
#  time_id         :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  belongs_to(:role, { :required => true, :class_name => "Role", :foreign_key => "role_id" })

  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:user_interests, { :class_name => "UserInterest", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:contacteds, { :class_name => "Contacted", :foreign_key => "user_id", :dependent => :destroy })

  belongs_to(:time, { :required => true, :class_name => "TimeAvailability", :foreign_key => "time_id" })

  validates(:username, { :presence => true })

  validates(:username, { :uniqueness => true })
end
