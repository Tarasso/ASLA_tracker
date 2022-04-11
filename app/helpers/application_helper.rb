# frozen_string_literal: true

module ApplicationHelper
  def read_bool(boolean)
    boolean ? 'Yes' : 'No'
  end

  def daylight_savings(dtime)
    if Time.zone.now.dst?
      dtime + 1.hour
    else
      dtime
    end
  end
end
