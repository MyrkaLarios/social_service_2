class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :no_control
      t.string :email

      t.timestamps
    end
  end
end
