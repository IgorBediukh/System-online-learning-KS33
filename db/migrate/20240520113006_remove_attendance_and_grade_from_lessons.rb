class RemoveAttendanceAndGradeFromLessons < ActiveRecord::Migration[7.1]
  def change
    remove_column :lessons, :attendance, :boolean
    remove_column :lessons, :grade, :integer
  end
end
