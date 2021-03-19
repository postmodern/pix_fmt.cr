module PixFmt
  module Grayscale(DEPTH)
    macro included
      extend ClassMethods(DEPTH)
    end

    module ClassMethods(DEPTH)
      abstract def gray(gray : DEPTH)

      def black
        gray(0)
      end
    end
  end
end
