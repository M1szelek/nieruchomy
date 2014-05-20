class ChangeMetrageType < ActiveRecord::Migration
  def change
  	change_column :offers, :metrage, :integer
  end
end
