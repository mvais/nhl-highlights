require 'httparty'

class NHL::PBP::Event
  attr_reader :event, :event_idx, :event_id, :event_type_id, :period, :period_type, :period_time,
              :period_time_remaining, :coord_x, :coord_y, :description, :players, :team,
              :secondary_type

  def initialize(pbp, event)
    setup(pbp, event)
  end

  def hit?
    @event_type_id == "hit"
  end

  def goal?
    @event_type_id == "goal"
  end

  def shot?
    @event_type_id == "shot"
  end

  def missed_shot?
    @event_type_id == "missed_shot"
  end

  def blocked_shot?
    @event_type_id == "blocked_shot"
  end

  def shot_attempt?
    ["missed_shot", "shot", "blocked_shot"].include? @event_type_id
  end

  def goal_scorer
    players.first.player if goal?
  end

  private

  def setup(pbp, event)
    @event_idx      = event.dig("about", "eventIdx")
    @event_id       = event.dig("about", "eventId")
    @event          = event.dig("result", "event")
    @event_type_id  = event.dig("result", "eventTypeId")&.downcase
    @period         = event.dig("about", "period")
    @period_type    = event.dig("about", "periodType")
    @period_time    = event.dig("about", "periodTime")
    @period_time_remaining = event.dig("about", "periodTimeRemaining")
    @coord_x        = event.dig("coordinates", "x")
    @coord_y        = event.dig("coordinates", "y")
    @players        = event.dig("players")
    @team           = event.dig("team")
    @description    = event.dig("result", "description")
    @secondary_type = event.dig("result", "secondaryType")&.downcase
  end
end
