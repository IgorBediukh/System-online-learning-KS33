class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.integer :grade
      t.boolean :attendance, default: false
      t.string :lesson_type
      t.datetime :lesson_time
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
