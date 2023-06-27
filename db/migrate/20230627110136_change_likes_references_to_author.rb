class ChangeLikesReferencesToAuthor < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        rename_column :likes, :user_id, :author_id
      end

      dir.down do
        rename_column :likes, :author_id, :user_id
      end
    end
  end
end