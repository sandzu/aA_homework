class AddPerson < ActiveRecord::Migration[5.2]
  def change
      create_table :people do |t|
        t.string :name
        t.integer :house_id

        t.timestamp
    end
    add_index :people, :house_id
  end
end
