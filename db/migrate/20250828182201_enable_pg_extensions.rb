class EnablePgExtensions < ActiveRecord::Migration[8.0]
  def change
    enable_extension "pg_trgm" unless extension_enabled?("pg_trgm")
    enable_extension "btree_gin" unless extension_enabled?("btree_gin")
  end
end
