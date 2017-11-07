class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.text :message
      t.string :stat

      t.timestamps
    end
  end
end
