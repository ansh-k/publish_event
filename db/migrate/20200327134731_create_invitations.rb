class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.boolean :confirm, default: false

      t.timestamps
    end
  end
end
