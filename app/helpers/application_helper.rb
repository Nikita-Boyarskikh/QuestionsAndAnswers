module ApplicationHelper
  def flash_class(level)
    case level.to_s
      when 'success' then 'ui green message'
      when 'alert' then 'ui red message'
      when 'notice' then 'ui blue message'
      when 'warning' then 'ui warning message'
      else "ui #{level} message"
    end
  end
end
