class AddWordIdToChoice < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :word_id, :integer
  end
end
