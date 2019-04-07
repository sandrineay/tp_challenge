class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :year
      t.string :collectivity
      t.string :contract_type
      t.string :name
      t.string :level
      t.string :specialty
      t.integer :men_count
      t.integer :women_count
    end
  end
end
