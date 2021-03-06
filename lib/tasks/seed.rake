require 'pry'

namespace :db do
  namespace :seed do
    task :goals => :environment do
      schedule = NHL::Schedule.new("20212022")

      schedule.dates.each do |date|
        date.games.each do |game|
          code       = game.gamePk
          highlight  = NHL::Highlight.new(code)
          pbp        = NHL::PBP.new(code)
          teams      = Team.all

          goals           = pbp.plays.filter(&:goal?).sort_by(&:event_id)
          goals_ids       = goals.map(&:event_id)
          highlight_goals = highlight.events
                              .filter { |highlight| goals_ids.include?(highlight.event_id) }
                              .sort_by(&:event_id)
          highlight_ids   = highlight_goals.map(&:event_id)

          next if highlight_goals.empty?

          goals = goals.filter { |goal| highlight_ids.include?(goal.event_id) }

          if goals_ids != highlight_ids
            puts "Unable to Create Highlights - #{game.gamePk} - #{game.gameDate}: #{game.teams.away.team.name} vs #{game.teams.home.team.name}"
            next
          end

          highlight_goals.zip(goals).each do |highlight_goal, goal|
            puts "Creating Highlights - #{game.gamePk} - #{game.gameDate}: #{game.teams.away.team.name} vs #{game.teams.home.team.name}"

            player = NHL::PBP::PlayerCreator.call(pbp.players, goal.goal_scorer.id)
    
            highlight = Highlight.create(
              nhl_season_id: pbp.season_id,
              nhl_game_id: pbp.game_id,
              nhl_event_id: goal.event_id,
              player: player,
              team: Team.where(team_id: goal.team.id)&.first,
              playback: highlight_goal.playbacks,
              date: pbp.date
            )
          end
        end
      end
    end

    task :teams => :environment do
      puts "Seeding Teams"
      teams_url = "https://records.nhl.com/site/api/franchise?include=teams.id&include=teams.active&include=teams.triCode&include=teams.placeName&include=teams.commonName&include=teams.fullName&include=teams.logos&include=teams.conference.name&include=teams.division.name&include=teams.franchiseTeam.firstSeason.id&include=teams.franchiseTeam.lastSeason.id&include=teams.franchiseTeam.teamCommonName"

      response = HTTParty.get(teams_url)

      unless response.code == 200
        puts "Error: Something went wrong!"
        return
      end

      json = JSON.parse(response.body)

      json['data'].each do |franchise|
        franchise['teams'].each do |team|
          Team.create(
            franchise_id: franchise['id'],
            team_id: team['id'],
            name: team['fullName'],
            code: team['triCode'],
            city: team['placeName'],
            active: team['active'] == 'Y'
          )

          puts "Created #{team['fullName']}"
        end
      end
    end
  end
end


# Highlights

# Player
# - first_name, last_name, nationality, position, nhl_player_id,

# Team
# - franchise_id, team_id, name, code, city, active
