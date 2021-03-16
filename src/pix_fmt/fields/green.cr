module PixFmt
  module Fields
    module Green(T)
      property g : T

      @[AlwaysInline]
      def green : T
        @g
      end

      @[AlwaysInline]
      def green=(new_green : T)
        @g = new_green
      end
    end
  end
end
