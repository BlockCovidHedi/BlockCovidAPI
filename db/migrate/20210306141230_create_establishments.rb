class CreateEstablishments < ActiveRecord::Migration[6.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
