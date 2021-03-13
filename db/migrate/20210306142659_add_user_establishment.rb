class AddUserEstablishment < ActiveRecord::Migration[6.1]
  def change
    add_reference :establishments, :user, foreign_key:true
  end
end
