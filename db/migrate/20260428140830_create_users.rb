class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :keycloak_uid
      t.string :email
      t.string :full_name
      t.string :avatar_url
      t.text :google_access_token
      t.datetime :google_token_expire_at

      t.timestamps
    end
    add_index :users, :keycloak_uid, unique: true
    add_index :users, :email, unique: true
  end
end
