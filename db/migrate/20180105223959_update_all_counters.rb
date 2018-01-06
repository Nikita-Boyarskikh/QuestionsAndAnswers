class UpdateAllCounters < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        Rake::Task['reset_cache_counters'].invoke
      end
    end
  end
end
