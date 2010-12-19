class Series < ActiveRecord::Base
  validates :name, :presence => true,
                   :uniqueness => true,
                   :length => {:maximum => 60}
  validates :name2, :length => {:maximum => 120}

  has_many :seasons, :dependent => :destroy
end
