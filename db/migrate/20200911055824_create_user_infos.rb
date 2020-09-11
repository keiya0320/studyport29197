class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|

      t.string :subject
      t.string :school
      t.text :profile
      t.references :user

      t.timestamps
    end
  end
end
