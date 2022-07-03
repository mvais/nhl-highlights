# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  active       :boolean
#  city         :string
#  code         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  franchise_id :integer
#  team_id      :integer
#
class Team < ApplicationRecord
  has_many :highlights

  def logo_url
    "https://www-league.nhlstatic.com/images/logos/teams-20212022-light/#{team_id}.svg"
  end
end
