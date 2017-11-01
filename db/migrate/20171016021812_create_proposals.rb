class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :project_name
      t.string :project_type
      t.string :budget
      t.string :duration
      t.string :client_company
      t.string :client_name
      t.string :client_email
      t.string :milestone_1
      t.string :milestone_2
      t.string :milestone_3
      t.string :overview
      t.string :fee_1
      t.string :fee_2
      t.string :fee_3
      t.integer :user_id
      t.string :time_created
      t.string :time_signed
    end
  end
end
