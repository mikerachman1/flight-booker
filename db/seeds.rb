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
  { code: 'PHL' },
  { code: 'CHI' }
])

flights = Flight.create([
  { scheduled_on: "2022-1-01", depart_time: "08:00:00", duration: 400, from_airport_id: 1, to_airport_id: 2 },
  { scheduled_on: "2022-1-01", depart_time: "10:00:00", duration: 400, from_airport_id: 2, to_airport_id: 1 },
  { scheduled_on: "2022-1-01", depart_time: "16:00:00", duration: 400, from_airport_id: 1, to_airport_id: 2 },
  { scheduled_on: "2022-1-01", depart_time: "20:00:00", duration: 400, from_airport_id: 2, to_airport_id: 1 },
  { scheduled_on: "2022-1-02", depart_time: "08:00:00", duration: 400, from_airport_id: 1, to_airport_id: 2 },
  { scheduled_on: "2022-1-02", depart_time: "10:00:00", duration: 400, from_airport_id: 2, to_airport_id: 1 },
  { scheduled_on: "2022-1-02", depart_time: "16:00:00", duration: 400, from_airport_id: 1, to_airport_id: 2 },
  { scheduled_on: "2022-1-02", depart_time: "20:00:00", duration: 400, from_airport_id: 2, to_airport_id: 1 }
])