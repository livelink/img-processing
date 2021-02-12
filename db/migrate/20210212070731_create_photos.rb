class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :original
      t.integer :effect
      t.string :output_image

      t.timestamps
    end
  end
end
