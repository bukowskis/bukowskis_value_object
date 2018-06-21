module ValueObject
  module Permissive
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

    def attributes
      self.class.dry_initializer.public_attributes(self)
    end
  end
end
