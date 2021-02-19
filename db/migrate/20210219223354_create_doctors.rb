class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :name
      t.string :inami
      t.string :phone_number

      t.timestamps
    end
  end
end
