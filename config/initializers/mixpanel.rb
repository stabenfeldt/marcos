if Rails.env.production?
  require 'mixpanel-ruby'
  MIXPANEL = Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN'])
end
