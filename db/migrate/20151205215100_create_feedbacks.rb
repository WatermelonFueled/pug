class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.text :comment
      t.references :recipient, foreign_key: true
      t.references :sender, foreign_key: true

      t.timestamps null: false
    end
    add_index :feedbacks, [:recipient_id, :created_at]
  end
end
