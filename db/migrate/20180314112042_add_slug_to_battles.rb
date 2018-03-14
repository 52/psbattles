class AddSlugToBattles < ActiveRecord::Migration[5.1]
  def change
    add_column :battles, :slug, :string
  end
end
