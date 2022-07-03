# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  nationality   :string
#  position      :string
#  nhl_player_id :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Player < ApplicationRecord
  has_many :highlights
end
