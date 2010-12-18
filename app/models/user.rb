class User < ActiveRecord::Base
  acts_as_authentic do |c|
    # c.my_config_option = my_value # for available options see
    # documentation in: Authlogic::ActsAsAuthentic
  end

  attr_accessor :old_password

  validate :validate_old_password, :if => :required_old_password?

  def validate_old_password
    errors.add(:old_password) unless valid_password?(self.old_password)
  end

  def required_old_password!
    @old_password_required = true
    @password_changed = true
  end

  def required_old_password?
    @old_password_required
  end
end
