class CreateClusters < ActiveRecord::Migration[7.0]
  def change
    create_table :clusters do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
