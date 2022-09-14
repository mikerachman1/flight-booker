class ChangeDatetimeInFlights < ActiveRecord::Migration[7.0]
  def change
    change_column :flights, :scheduled_on, :date
    change_table :flights do |t|
      t.time :depart_time
    end
  end
end
