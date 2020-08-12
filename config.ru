require_relative 'config/environment'

use Rack::Ougai::LogRequests, Application.logger

run UserRoutes
