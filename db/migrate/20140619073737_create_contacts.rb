class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :mno
      t.string :emailid
      t.string :add

      t.timestamps
    end
  end
end
