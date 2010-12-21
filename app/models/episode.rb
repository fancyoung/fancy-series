class Episode < ActiveRecord::Base
  validates :season_id, :presence => true,
                        :numericality => true
  validates :seq, :presence => true,
                  :numericality =>true
  belongs_to :season
end
