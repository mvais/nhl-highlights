module ApplicationHelper
  include Pagy::Frontend

  def format_position(position)
    case position
    when 'Center'
      'C'
    when 'Right Wing'
      'RW'
    when 'Left Wing'
      'LW'
    when 'Defenseman'
      'D'
    else
      'Forward'
    end
  end
end
