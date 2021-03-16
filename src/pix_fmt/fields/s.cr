module PixFmt
  module Fields
    module S(T)
      property s : T

      @[AlwaysInline]
      def saturation : T
        @s
      end

      @[AlwaysInline]
      def saturation=(new_saturation : T)
        @s = new_saturation
      end

    end
  end
end
