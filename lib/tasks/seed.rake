namespace :db do
  namespace :seed do
    task :goals => :environment do
      code = "2021021275"

      highlight  = NHL::Highlight.new(code)
      pbp        = NHL::PBP.new(code)

      # TODO: Populate Goals
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
