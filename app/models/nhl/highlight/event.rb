class NHL::Highlight::Event
  attr_reader :goals, :code, :event_id, :images, :playbacks, :duration,
              :description, :blurb

  def initialize(highlight, code)
    @highlight = highlight
    @code = code

    setup
  end

  private

  def setup
    @event_id    = @highlight['keywords'].find { |keyword| keyword["type"] == "statsEventId" }&.dig("value")&.to_i || nil
    @images      = @highlight['image']
    @playbacks   = @highlight['playbacks']
    @duration    = @highlight['duration']
    @description = @highlight['description']
    @blurb       = @highlight['blurb']
  end
end
