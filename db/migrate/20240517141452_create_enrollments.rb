class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :user, foreign_key: true
      t.references :business_model, foreign_key: true
      t.timestamps
    end
    add_index :enrollments, [:user_id, :business_model_id], unique: true
  end
end
