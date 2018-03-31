class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def inc_counter(who, what)
    who.increment!(counter_name(what))
  end

  def dec_counter(who, what)
    who.increment!(counter_name(what), -1)
  end

  def counter_name(what)
    "#{what.class.name.demodulize.downcase.pluralize}_count"
  end
end