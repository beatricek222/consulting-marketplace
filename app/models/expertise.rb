# == Schema Information
#
# Table name: expertises
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Expertise < ApplicationRecord
  has_many(:user_interests, { :class_name => "UserInterest", :foreign_key => "expertise_id", :dependent => :destroy })

  serialize :expertise
end
