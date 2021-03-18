require "./spec_helper"
require "../src/pix_fmt/conversions"

Spectator.describe PixFmt::Conversions do
  let(black) { {0.0, 0.0, 0.0} }
  let(white) { {255.0, 255.0, 255.0} }
  let(red)   { {255.0, 0.0, 0.0} }
  let(green) { {0.0, 255.0, 0.0} }
  let(blue)  { {0.0, 0.0, 255.0} }

  describe ".hsv_to_rgb" do
    context "when brightness is 0" do
      it "must return 0.0, 0.0, 0.0" do
        expect(subject.hsv_to_rgb(0, 0, 0)).to     eq(black)
        expect(subject.hsv_to_rgb(100, 1, 0)).to   eq(black)
        expect(subject.hsv_to_rgb(100, 0.5, 0)).to eq(black)
      end
    end

    context "when brightness is 1 and saturation is 0" do
      it "must return 255.0, 255.0, 255.0" do
        expect(subject.hsv_to_rgb(0, 0, 1)).to   eq(white)
        expect(subject.hsv_to_rgb(100, 0, 1)).to eq(white)
      end
    end

    context "when hue is 0, saturation is 1, and value is 1" do
      it "must return RGB red" do
        expect(subject.hsv_to_rgb(0, 1, 1)).to eq(red)
      end
    end

    context "when hue is 120, saturation is 1, and value is 1" do
      it "must return RGB green" do
        expect(subject.hsv_to_rgb(120, 1, 1)).to eq(green)
      end
    end

    context "when hue is 240, saturation 1, and value is 1" do
      it "must return RGB blue" do
        expect(subject.hsv_to_rgb(240, 1, 1)).to eq(blue)
      end
    end

    context "when given a random HSV value" do
      it "must return the RGB equivalant" do
        expect(subject.hsv_to_rgb(120, 0.5, 0.80)).to eq({102.0, 204.0, 102.0})
      end
    end

    context "when hue is 0 or 360" do
      it "must treat them equivalent" do
        expect(subject.hsv_to_rgb(0, 0.5, 0.5)).to eq(subject.hsv_to_rgb(360, 0.5, 0.5))
      end
    end
  end

  describe ".hsl_to_rgb" do
    context "when lightness is 0" do
      it "must return RGB black" do
        expect(subject.hsl_to_rgb(0, 0, 0)).to    eq(black)
        expect(subject.hsl_to_rgb(100, 0, 0)).to  eq(black)
        expect(subject.hsl_to_rgb(54, 0.5, 0)).to eq(black)
      end
    end

    context "when lightness is 1" do
      it "must return RGB white" do
        expect(subject.hsl_to_rgb(0, 0, 1)).to   eq(white)
        expect(subject.hsl_to_rgb(0, 0.5, 1)).to eq(white)
        expect(subject.hsl_to_rgb(110, 0, 1)).to eq(white)
      end
    end

    context "when hue is 0, saturation is 1, lightness is 0.5" do
      it "must return RGB red" do
        expect(subject.hsl_to_rgb(0, 1, 0.5)).to eq(red)
      end
    end

    context "when hue is 120, saturation is 1, lightness is 0.5" do
      it "must return RGB green" do
        expect(subject.hsl_to_rgb(120, 1, 0.5)).to eq(green)
      end
    end

    context "when hue is 240, saturation 1, lightness is 0.5" do
      it "must return RGB blue" do
        expect(subject.hsl_to_rgb(240, 1, 0.5)).to eq(blue)
      end
    end

    context "when given a random HSL value" do
      it "must return the RGB equivalent" do
        expect(subject.hsl_to_rgb(87.27, 0.5, 0.5686)).to     eq({149.0, 199.0, 89.0})
        expect(subject.hsl_to_rgb(271.83, 0.5399, 0.4176)).to eq({109.0, 48.0, 163.0})
        expect(subject.hsl_to_rgb(63.6, 0.5984, 0.4882)).to   eq({190.0, 195.0, 49.0})
      end
    end

    context "when hue is 0 or 360" do
      it "must treat them equivalent" do
        expect(subject.hsl_to_rgb(0, 0.5, 0.5)).to eq(subject.hsl_to_rgb(360, 0.5, 0.5))
      end
    end
  end
end
