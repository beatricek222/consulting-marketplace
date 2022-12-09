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
end
