class CreateLoginTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :login_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.text :token, null: false, unique: true

      t.timestamps
    end
  end
end
