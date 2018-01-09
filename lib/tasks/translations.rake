require 'utils/utils'

def without_faker(data)
  p '-------'
  data.map do |k,v|
    v_like_hash = v.respond_to?(:keys)
    p v_like_hash
    v.delete('faker') if v_like_hash
    [k, (v_like_hash ? without_faker(v) : v)]
  end.to_h
end

def syms_to_strs(hash)
  JSON.parse(JSON[hash])
end

def translations_from_locale_files
  data = {}
  Dir['config/locales/**/*']
    .select { |file| File.extname(file) =~ /\.(yaml|yml)/ }
    .each { |file| data.merge! YAML::load File.open file }
  data
end

def auto(hash)
  Hash.deep_difference hash, syms_to_strs(translations_from_locale_files)
end

def path_to_hash(path)
  parts = path.split('.')
  parts = [path] if parts.empty?
  hash = ''
  parts.reverse.each { |p| hash = {p => hash} }
  hash
end

def merge_hashes(_key, old, new)
  if old.eql? new
    old
  elsif new.respond_to? :keys and old.respond_to? :keys
    hash = Set.new(new.keys + old.keys).inject([]) { |merged, key| merged + [[key, merge_hashes(key, old[key], new[key])]] }.to_h
    hash.each do |k, v|
      [k, (v.respond_to?('to_h') ? v.to_h : v)]
    end.to_h
  else
    new.nil? ? old : new
  end
end

def find_t_in_file(file)
  data = {}
  regex = /[^\w]t[\(\s][:'"]?([\w\.]+)[:'"]?\)?/im
  File.read(file).scan(regex)
    .map { |path| path_to_hash path[0] }
    .each { |h| data.merge! h, &method(:merge_hashes) }
  data
end

def translations_from_source_files
  data = {}
  Dir['app/**/*']
    .select { |file| File.extname(file) =~ /\.(slim|erb|haml|rb)/ }
    .each { |file| data.merge! find_t_in_file file }
  data
end

def new_keys(hash)
  Hash.deep_keys_diff syms_to_strs(translations_from_source_files), hash
end

DEFAULTS = { locale: I18n.default_locale, translation_key: '.', format: 'yaml' }

def with_defaults(args, with_locale_key=true, &block)
  args.with_defaults DEFAULTS
  locale = args[:locale]
  key = args[:translation_key]
  I18n.locale = locale
  data = I18n.t(key)
  data = syms_to_strs(data)
  data = { key.to_s => data } if key.to_s != '.'
  data = { locale.to_s => data } if with_locale_key
  data = yield(data) if block_given?
  data.send('to_' + args[:format])
end

namespace :translations do
  desc 'Print translations by :translation_key from :locale in :format format'
  task :print, [:locale, :translation_key, :format] => :environment do |t, args|
    puts with_defaults(args) { |translates| without_faker translates  }
  end

  desc 'Print auto configured translations by :translation_key from :locale in :format format'
  task :print_auto, [:locale, :translation_key, :format] => :environment do |t, args|
    puts with_defaults(args) { |translates| auto without_faker translates }
  end

  desc 'Print NOT TRANSLATED keys by :translation_key from :locale in :format format'
  task :print_new, [:locale, :translation_key, :format] => :environment do |t, args|
    puts with_defaults(args, false) { |translates| new_keys without_faker translates }
  end
end
