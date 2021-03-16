require "../src/pix_fmt/rgb"
require "./spec_helper"

Spectator.describe PixFmt::RGB do
  describe "#initialize" do
    context "when given no arguments" do
      subject { described_class.new }

      it "must set #r to 0" do
        expect(subject.r).to eq(0)
      end

      it "must set #g to 0" do
        expect(subject.g).to eq(0)
      end

      it "must set #b to 0" do
        expect(subject.b).to eq(0)
      end
    end

    context "when given a r: argument" do
      let(red) { 42_u8 }
      subject { described_class.new(r: red) }

      it "must set #r to red" do
        expect(subject.r).to eq(red)
      end

      it "must set #g to 0" do
        expect(subject.g).to eq(0)
      end

      it "must set #b to 0" do
        expect(subject.b).to eq(0)
      end
    end

    context "when given a g: argument" do
      let(green) { 42_u8 }
      subject { described_class.new(g: green) }

      it "must set #r to 0" do
        expect(subject.r).to eq(0)
      end

      it "must set #g to green" do
        expect(subject.g).to eq(green)
      end

      it "must set #b to 0" do
        expect(subject.b).to eq(0)
      end
    end

    context "when given a b: argument" do
      let(blue) { 42_u8 }
      subject { described_class.new(b: blue) }

      it "must set #r to red" do
        expect(subject.r).to eq(0)
      end

      it "must set #g to 0" do
        expect(subject.g).to eq(0)
      end

      it "must set #b to blue" do
        expect(subject.b).to eq(blue)
      end
    end
  end

  describe ".black" do
    subject { described_class.black }

    it "must set #r to 0" do
      expect(subject.r).to eq(0)
    end

    it "must set #g to 0" do
      expect(subject.g).to eq(0)
    end

    it "must set #b to 0" do
      expect(subject.b).to eq(0)
    end
  end

  describe ".gray" do
    let(grayness) { 42_u8 }
    subject { described_class.gray(grayness) }

    it "must set #r to the value of grayness" do
      expect(subject.r).to eq(grayness)
    end

    it "must set #g to the value of grayness" do
      expect(subject.g).to eq(grayness)
    end

    it "must set #b to the value of grayness" do
      expect(subject.b).to eq(grayness)
    end
  end

  describe ".red" do
    let(redness) { 42_u8 }
    subject { described_class.red(redness) }

    it "must set #r to the value of redness" do
      expect(subject.r).to eq(redness)
    end

    it "must set #g to 0" do
      expect(subject.g).to eq(0)
    end

    it "must set #b to 0" do
      expect(subject.b).to eq(0)
    end
  end

  describe ".green" do
    let(greenness) { 42_u8 }
    subject { described_class.green(greenness) }

    it "must set #r to 0" do
      expect(subject.r).to eq(0)
    end

    it "must set #g to the value of greenness" do
      expect(subject.g).to eq(greenness)
    end

    it "must set #b to 0" do
      expect(subject.b).to eq(0)
    end
  end

  describe ".blue" do
    let(blueness) { 42_u8 }
    subject { described_class.blue(blueness) }

    it "must set #r to 0" do
      expect(subject.r).to eq(0)
    end

    it "must set #g to 0" do
      expect(subject.g).to eq(0)
    end

    it "must set #b to the value of blueness" do
      expect(subject.b).to eq(blueness)
    end
  end

  let(red)   { 42_u8 }
  let(green) { 42_u8 }
  let(blue)  { 42_u8 }

  subject { described_class.new(r: red, g: green, b: blue) }

  describe "#to_rgba" do
    it "must return a new RGBA struct with matching #r, #g, #b values" do
      rgba = subject.to_rgba

      expect(rgba.r).to eq(subject.r)
      expect(rgba.g).to eq(subject.g)
      expect(rgba.b).to eq(subject.b)
      expect(rgba.a).to eq(255)
    end
  end

  describe "#to_rgba(RGBA *)" do
    it "must set the #r, #g, #b and #a fields" do
      rgba = PixFmt::RGBA.new
      subject.to_rgba(pointerof(rgba))

      expect(rgba.r).to eq(subject.r)
      expect(rgba.g).to eq(subject.g)
      expect(rgba.b).to eq(subject.b)
      expect(rgba.a).to eq(255)
    end
  end
end
