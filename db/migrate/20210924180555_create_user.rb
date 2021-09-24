class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, :city
      t.date :birth_date
      t.timestamps
    end
  end
end
