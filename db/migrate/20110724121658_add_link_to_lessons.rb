class AddLinkToLessons < ActiveRecord::Migration
  def self.up
    add_column :lessons, :link, :string
  end

  def self.down
    remove_column :lessons, :link
  end
end
