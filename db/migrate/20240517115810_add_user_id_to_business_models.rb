class AddUserIdToBusinessModels < ActiveRecord::Migration[7.1]
  def change
    add_reference :business_models, :user, null: true, foreign_key: true
  end
end
