class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected

  def inc_counter(what)
    self.increment!(counter_name(what))
  end

  def dec_counter(what)
    self.increment!(counter_name(what), -1)
  end

  def counter_name(what)
    "#{what.class.name.demodulize.downcase.pluralize}_count"
  end

  def fix_tags_format(model)
    !!fix_tags(model.tags)
  end

  def fix_tags(tags)
    return tags if tags.instance_of?(ActiveRecord) or tags.is_a?(Tag)

    if tags.is_a? Hash
      try = Tag.create(tags)
      return try if try
    end

    t = tags.is_a?(Array) ? tags : tags.split(/[,\s]+/)
    return false if t.empty?
    return Tag.create(title: t[0]) if t.length == 1

    t.map {|tag| fix_tags tag }.select do |tag|
      tag && (
        tag.is_a?(Array) || !(
          tag.is_a?(Tag) && tag.new_record?
        )
      )
    end
  end
end
