class AddValidUntilToLoginTokens < ActiveRecord::Migration[6.1]
  def change
    add_column :login_tokens, :valid_until, :datetime, null: false
  end
end
