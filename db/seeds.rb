# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tables = ActiveRecord::Base.connection.tables - ['schema_migrations']

# In SQLite, there is no TRUNCATE statement, instead, it's
tables.each do |table|
  ActiveRecord::Base.connection.execute "DELETE FROM `#{table}`"
  ActiveRecord::Base.connection.execute "DELETE FROM sqlite_sequence WHERE name='#{table}'"
end

airports = Airport.create([
  { code: 'SFO' },
  { code: 'NYC' },
  { code: 'PHL' },
  { code: 'CHI' },
  { code: 'LAX' }
])