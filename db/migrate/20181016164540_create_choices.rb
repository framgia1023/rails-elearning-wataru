class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
