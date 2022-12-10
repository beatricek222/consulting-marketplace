# == Schema Information
#
# Table name: contacteds
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  other_user_id :integer
#  user_id       :integer
#
class Contacted < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "other_user_id" })
end
