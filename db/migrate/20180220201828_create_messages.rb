class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :state
      t.string :job_id

      t.timestamps
    end
  end
end
