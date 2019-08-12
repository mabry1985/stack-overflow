class AddJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_users, id: false do |t|
      t.belongs_to :answer, index: true
      t.belongs_to :user, index: true
    end
  end
end
