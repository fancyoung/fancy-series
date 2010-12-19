class Series < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => {:maximum => 60}
  validates :name, :length => {:maximum => 120}
end
