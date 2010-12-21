class Season < ActiveRecord::Base
  validates :series_id, :presence => true,
                        :numericality => true
  validates :seq, :presence => true,
                        :numericality => true
  validates :episodes_count, :presence => true,
                        :numericality => true
  belongs_to :series
  has_many :episodes, :dependent => :destroy
end
