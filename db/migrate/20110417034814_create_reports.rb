class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :title
      t.string :description
      t.string :lat
      t.string :lng
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
