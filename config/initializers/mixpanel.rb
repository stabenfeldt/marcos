if Rails.env.production?
  require 'mixpanel-ruby'
  $mixpanel = Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN'])
end
