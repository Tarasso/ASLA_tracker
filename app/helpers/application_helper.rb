# frozen_string_literal: true

module ApplicationHelper
  def read_bool(boolean)
    boolean ? 'Yes' : 'No'
  end


  def daylight_savings(dt)
    if Time.zone.now.dst?
      return dt + 1.hour 
    else
      return dt
    end  
  end
end
