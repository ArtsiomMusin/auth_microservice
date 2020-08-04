namespace :db do
  desc 'Dump schema'
  task dump: :settings do
    require 'sequel/core'
    require 'sequel/extensions/schema_dumper'
    include Sequel::SchemaDumper
    Sequel.extension :schema_dumper

    db = Sequel.connect(Settings.db.to_hash)
    schema = db.dump_schema_migration(indexes: true, foreign_keys: true)
    File.write File.expand_path('../../db/schema.rb', __dir__), schema
  end
end
