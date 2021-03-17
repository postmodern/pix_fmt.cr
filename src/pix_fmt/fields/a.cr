module PixFmt
  module Fields
    module A(T)
      property a : T

      @[AlwaysInline]
      def alpha : T
        @a
      end

      @[AlwaysInline]
      def alpha=(new_alpha : T)
        @a = new_alpha
      end

      @[AlwaysInline]
      def transparent?
        @a < 255
      end

      @[AlwaysInline]
      def opaque?
        @a == 255
      end
    end
  end
end
