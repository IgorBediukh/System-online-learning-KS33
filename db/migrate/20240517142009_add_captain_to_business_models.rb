class AddCaptainToBusinessModels < ActiveRecord::Migration[7.1]
  def change
    add_reference :business_models, :captain, foreign_key: { to_table: :users }
  end
end
