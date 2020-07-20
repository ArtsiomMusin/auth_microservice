namespace :db do
  desc 'Run migrations'
  task :migrate, %i[version] => :settings do |t, args|
    require 'sequel/core'
  
    Sequel.extension :migration
    
    Sequel.connect(Settings.db.to_hash) do |db|
      migrations = File.expand_path('../../db/migrations', __dir__)
      Sequel::Migrator.run(db, migrations, target: args.version&.to_i)
    end

    Rake::Task['db:dump'].invoke
  end
end
