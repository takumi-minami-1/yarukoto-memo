class AddUserToYarukotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :yarukotos, :user, foreign_key: true
  end
end
