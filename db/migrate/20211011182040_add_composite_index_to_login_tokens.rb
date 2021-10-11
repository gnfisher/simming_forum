class AddCompositeIndexToLoginTokens < ActiveRecord::Migration[6.1]
  def change
    add_index :login_tokens, [:valid_until, :token]
  end
end
