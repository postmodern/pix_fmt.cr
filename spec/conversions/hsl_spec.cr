require "../spec_helper"
require "../../src/pix_fmt/conversions/hsl"

Spectator.describe PixFmt::Conversions::HSL do
  describe ".to_rgb(Float32, Float32, Float32)" do
    let(black) { {0.0, 0.0, 0.0} }
    let(white) { {255.0, 255.0, 255.0} }
    let(red)   { {255.0, 0.0, 0.0} }
    let(green) { {0.0, 255.0, 0.0} }
    let(blue)  { {0.0, 0.0, 255.0} }

    context "when lightness is 0%" do
      it "must return RGB black" do
        expect(subject.to_rgb(0.0, 0.0, 0.0)).to    eq(black)
        expect(subject.to_rgb(100.0, 0.0, 0.0)).to  eq(black)
        expect(subject.to_rgb(54.0, 0.5, 0.0)).to eq(black)
      end
    end

    context "when lightness is 100%" do
      it "must return RGB white" do
        expect(subject.to_rgb(0.0, 0.0, 1.0)).to   eq(white)
        expect(subject.to_rgb(0.0, 0.5, 1.0)).to eq(white)
        expect(subject.to_rgb(110.0, 0.0, 1.0)).to eq(white)
      end
    end

    context "when hue is 0 degrees, saturation is 100%, lightness is 50%" do
      it "must return RGB red" do
        expect(subject.to_rgb(0.0, 1.0, 0.5)).to eq(red)
      end
    end

    context "when hue is 120 degrees, saturation is 100%, lightness is 50%" do
      it "must return RGB green" do
        expect(subject.to_rgb(120.0, 1.0, 0.5)).to eq(green)
      end
    end

    context "when hue is 240 degrees, saturation 100%, lightness is 50%" do
      it "must return RGB blue" do
        expect(subject.to_rgb(240.0, 1.0, 0.5)).to eq(blue)
      end
    end

    context "when given a random HSL value" do
      it "must return the RGB equivalent" do
        expect(subject.to_rgb(87.27, 0.5, 0.5686)).to     eq({149.0, 199.0, 89.0})
        expect(subject.to_rgb(271.83, 0.5399, 0.4176)).to eq({109.0, 48.0, 163.0})
        expect(subject.to_rgb(63.6, 0.5984, 0.4882)).to   eq({190.0, 195.0, 49.0})
      end
    end

    context "when hue is 0 or 360 degrees" do
      it "must treat them equivalent" do
        expect(subject.to_rgb(0.0, 0.5, 0.5)).to eq(subject.to_rgb(360.0, 0.5, 0.5))
      end
    end
  end

  describe ".to_rgb(UInt8, UInt8, UInt8)" do
    let(black) { {0_u8, 0_u8, 0_u8} }
    let(white) { {255_u8, 255_u8, 255_u8} }
    let(red)   { {255_u8, 0_u8, 0_u8} }
    let(green) { {0_u8, 255_u8, 0_u8} }
    let(blue)  { {0_u8, 0_u8, 255_u8} }

    context "when lightness is 0%" do
      it "must return RGB black" do
        expect(subject.to_rgb(0_u8, 0_u8, 0_u8)).to eq(black)
        expect(subject.to_rgb(((100 / 360) * 256).to_u8, 0_u8, 0_u8)).to  eq(black)
        expect(subject.to_rgb(((54 / 360) * 256).to_u8, 128_u8, 0_u8)).to eq(black)
      end
    end

    context "when lightness is 100%" do
      it "must return RGB white" do
        expect(subject.to_rgb(0_u8, 0_u8, 255_u8)).to   eq(white)
        expect(subject.to_rgb(0_u8, 128_u8, 255_u8)).to eq(white)
        expect(subject.to_rgb(((110 / 360) * 255).to_u8, 0_u8, 255_u8)).to eq(white)
      end
    end

    context "when hue is 0 degrees, saturation is 100%, lightness is 50%" do
      it "must return RGB red" do
        expect(subject.to_rgb(0_u8, 255_u8, 128_u8)).to eq(red)
      end
    end

    context "when hue is 120 degrees, saturation is 100%, lightness is 50%" do
      it "must return RGB green" do
        expect(subject.to_rgb(((120 / 360) * 255).to_u8, 255_u8, 128_u8)).to eq(green)
      end
    end

    context "when hue is 240 degrees, saturation 100%, lightness is 50%" do
      it "must return RGB blue" do
        expect(subject.to_rgb(((240 / 360) * 255).to_u8, 255_u8, 128_u8)).to eq(blue)
      end
    end

    context "when given a random HSL value" do
      it "must return the RGB equivalent" do
        expect(subject.to_rgb(((87.27 / 360) * 255).to_u8, 128_u8, (0.5686 * 255).to_u8)).to     eq({149_u8, 199_u8, 89_u8})
        expect(subject.to_rgb(((271.83 / 360) * 255).to_u8, (0.5399 * 255).to_u8, (0.4176 * 255).to_u8)).to eq({109_u8, 48_u8, 163_u8})
        expect(subject.to_rgb(((63.6 / 360) * 255).to_u8, (0.5984 * 255).to_u8, (0.4882 * 255).to_u8)).to   eq({190_u8, 195_u8, 49_u8})
      end
    end

    context "when hue is 0 degrees or 360 degrees" do
      it "must treat them equivalent" do
        expect(subject.to_rgb(0_u8, 128_u8, 128_u8)).to eq(subject.to_rgb(255_u8, 128_u8, 128_u8))
      end
    end
  end
end
