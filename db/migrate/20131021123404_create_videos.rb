class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_link
      t.string :song
      t.string :description
      t.string :submitted_by
      t.string :submitter_id
      t.timestamps
    end
  end
end
