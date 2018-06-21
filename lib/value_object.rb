require 'dry-initializer'
require 'value_object/permissive'

module ValueObject
  def self.included(base)
    base.extend Dry::Initializer
    base.extend ClassMethods
    base.prepend Initializer
  end

  module ClassMethods
    def attribute(*args)
      option(*args)
    end
  end

  module Initializer
    def initialize(**data)
      source_keys = self.class.dry_initializer.options.map(&:source)
      unknown_keys = data.keys - source_keys

      raise KeyError, "Key(s) #{unknown_keys} not found in #{source_keys}" if unknown_keys.any?
      super
    end
  end

  def attributes
    self.class.dry_initializer.public_attributes(self)
  end
end
