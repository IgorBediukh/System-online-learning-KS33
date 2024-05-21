class AddNotNullConstraintsToLessons < ActiveRecord::Migration[7.1]
  def change
    change_column_null :lessons, :lesson_type, false
    change_column_null :lessons, :lesson_time, false
  end
end
