class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.string :title
      t.text :detail

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
