namespace :db do
  desc 'Seed DB'
  task seed: :settings do |t, args|
    env = File.expand_path('../../config/environment', __dir__)
    require_relative env

    load File.expand_path('./create_users.rb', __dir__)
  end
end
