class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :author
      t.string :header
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
