# This file is used by Rack-based servers to start the application.

RAILS_RELATIVE_URL_ROOT="/cliper-admin-api"

require ::File.expand_path('../config/environment', __FILE__)

if RAILS_RELATIVE_URL_ROOT
  map RAILS_RELATIVE_URL_ROOT do
    run Rails.application
  end
else
  run RedmineApp::Application
end
