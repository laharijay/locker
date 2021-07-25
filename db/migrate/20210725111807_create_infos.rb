class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :user_name
      t.string :email
      t.string :website_name
      t.string :password
      t.string :confirm_password
      t.references :user
      t.timestamps
    end
  end
end
