require 'set'

class Hash
  def self.deep_difference(hash1, hash2)
    hash1.map do |locale, data|
      other_data = hash2[locale]
      [
        locale, (
          data.respond_to?(:reject) ? (data.reject do |k, v|
            other_data and other_data.has_key? k and other_data[k] == v
          end) : data
        )
      ]
    end.to_h
  end

  def self.deep_keys_diff(hash1, hash2)
    h1_keys = Set.new(hash1.keys)
    h2_keys = Set.new(hash2.keys)
    common_keys = h1_keys & h2_keys
    different_keys = (h1_keys | h2_keys) - common_keys
    result = {}

    different_keys.each { |k| result[k] = hash1[k] || hash2[k] }
    common_keys.each do |k|
      h1_has_keys = hash1[k].respond_to? :keys
      h2_has_keys = hash2[k].respond_to? :keys
      if h1_has_keys and h2_has_keys
        result[k] = self.deep_keys_diff(hash1[k], hash2[k])
      elsif h1_has_keys
        result[k] = hash1[k]
      elsif h2_has_keys
        result[k] = hash2[k]
      end
    end
    result
  end
end
