class ChangeLessonAssociation < ActiveRecord::Migration[7.1]
  def change
    # Remove the reference to enrollment
    remove_reference :lessons, :enrollment, foreign_key: true

    # Add the reference to business_model
    add_reference :lessons, :business_model, null: false, foreign_key: true
  end
end
