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
end
