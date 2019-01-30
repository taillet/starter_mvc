class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |m|
      m.string :title
      m.string :caption
      m.string :link
    end
  end
end
