class RenameRaitingToRatingInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :raiting, :rating
  end
end
