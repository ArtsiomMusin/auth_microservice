namespace :db do
  desc 'Seed DB'
  task seed: :settings do |t, args|
    env = File.expand_path('../../config/environment', __dir__)
    require_relative env

    (1..3).each do |i|
      user = User.create(
        name: "Username#{i}", email: "test#{i}@test.com", 
        password: 'fake', password_confirmation: 'fake'
      )

      UserSession.create(user_id: user.id)
    end
  end
end
