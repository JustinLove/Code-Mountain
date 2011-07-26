class AddBenefitsToLessons < ActiveRecord::Migration
  def self.up
    add_column :lessons, :benefits, :text
  end

  def self.down
    remove_column :lessons, :benefits, :text
  end
end
