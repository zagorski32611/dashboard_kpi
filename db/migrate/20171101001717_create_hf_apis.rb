class CreateHfApis < ActiveRecord::Migration[5.1]
  def change
    create_table :hf_apis do |t|
      t.string :hf_username
      t.string :tickets

      t.timestamps
    end
  end
end
