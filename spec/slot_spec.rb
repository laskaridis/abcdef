require "spec_helper"

describe Slot do

  context "given a slot starting at (0,0) and ending to (2,2)" do
    subject { Slot.new(Location.new(0,0), Location.new(2,2)) }

    describe "#contains?" do

      context "given location (1,1)" do
        let(:location) { Location.new(1,1) }

        it "should return true" do
          expect(subject.contains?(location)).to eq true
        end
      end

      context "given location (3,3)" do
        let(:location) { Location.new(3,3) }

        it "should return false" do
          expect(subject.contains?(location)).to eq false
        end
      end
    end

    describe "#overlaps_with?" do

      context "given slot starting at (1,1) and ending at (3,3)" do
        let(:slot) { Slot.new(Location.new(1,1), Location.new(3,3)) }

        it "should return true" do
          expect(subject.overlaps_with?(slot)).to eq true
        end
      end

      context "given slot starting at (3,3) and ending at (4, 4)" do
        let(:slot) { Slot.new(Location.new(3,3), Location.new(4,4)) }

        it "should return false" do
          expect(subject.overlaps_with?(slot)).to eq false
        end
      end
    end
  end
end
