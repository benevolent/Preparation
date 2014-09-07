class CreateList < ActiveRecord::Migration
  def change
    create_table :list do |t|
      t.string :title
      t.integer :level
      t.string :description
    end
  end
end
