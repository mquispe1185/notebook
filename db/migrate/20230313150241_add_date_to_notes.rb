class AddDateToNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :notes, :date, :datetime
  end
end
