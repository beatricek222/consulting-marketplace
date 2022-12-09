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
end
