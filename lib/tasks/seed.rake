namespace :db do
  namespace :seed do
    task :goals => :environment do
      code = "2021021275"

      highlight  = NHL::Highlight.new(code)
      pbp        = NHL::PBP.new(code)

      # TODO: Populate Goals
    end
  end
end
