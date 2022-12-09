# == Schema Information
#
# Table name: user_interests
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  expertise_id :integer
#  user_id      :integer
#
class UserInterest < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:expertise, { :required => true, :class_name => "Expertise", :foreign_key => "expertise_id" })
end
