class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.belongs_to :doctor
      t.belongs_to :user
      t.string :recommendation
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
