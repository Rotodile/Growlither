class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :datetime

      t.timestamps
    end
  end
end
