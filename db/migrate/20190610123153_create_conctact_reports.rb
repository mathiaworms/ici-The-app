class CreateConctactReports < ActiveRecord::Migration[5.2]
  def change
    create_table :conctact_reports do |t|
    	t.string :title
    	t.text :content
    	t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
