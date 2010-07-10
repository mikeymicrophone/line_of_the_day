class AddNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :name
      t.string :sender_email
      t.timestamps
    end
    
    create_table :editions do |t|
      t.string :subject
      t.text :body
      t.belongs_to :newsletter
      t.datetime :sent_on
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
    drop_table :editions
  end
end
