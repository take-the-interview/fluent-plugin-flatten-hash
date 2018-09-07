module Fluent
  class FlattenHashFilter < Filter
    Plugin.register_filter('flatten_hash', self)

    require_relative 'flatten_hash_util'
    include FlattenHashUtil

    config_param :separator, :string, :default => '.'
    config_param :flatten_array, :bool, :default => true
    config_param :remove_tag_prefix, :string, :default => ''

    def configure(conf)
      super
    end

    def filter(tag, time, record)
      flatten_record(record, [])
    end
  end if defined?(Filter)
end
