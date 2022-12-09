# == Schema Information
#
# Table name: time_availabilities
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TimeAvailability < ApplicationRecord
  has_many(:users, { :class_name => "User", :foreign_key => "time_id" })
end
