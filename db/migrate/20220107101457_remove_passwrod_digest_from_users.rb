class RemovePasswrodDigestFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :passwrod_digest
  end
end
