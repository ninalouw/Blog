class AddPostReferenceToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :post, foreign_key: true, index:true 
  end
end
