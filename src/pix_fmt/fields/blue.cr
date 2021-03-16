module PixFmt
  module Fields
    module Blue(T)
      property b : T

      @[AlwaysInline]
      def blue : T
        @b
      end

      @[AlwaysInline]
      def blue=(new_blue : T)
        @b = new_blue
      end
    end
  end
end
