require "spec_helper"

describe Commands::Store do
  let(:app) { SimpleWarehouse.new }
  subject { Commands::Store.new(app) }

  it { should be_a Commands::Command }

  describe "#execute" do

    context "when no x location specified" do
      let(:opts) { [ ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No x location provided")
      end
    end

    context "when no y location specified" do
      let(:opts) { [ 1 ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No y location provided")
      end
    end

    context "when no crate width specified" do
      let(:opts) { [ 1, 2 ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No crate width provided")
      end
    end

    context "when no crate height specified" do
      let(:opts) { [ 1, 2, 1 ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No crate height provided")
      end
    end

    context "when no product specified" do
      let(:opts) { [ 1, 2, 1, 2 ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No product name provided")
      end
    end

    context "when no store is initialized" do
      let(:opts) { [ 1, 2, 1, 2, "x" ] }

      before { app.store = nil }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No store initialized")
      end
    end

    context "when location, dimensions and product is provided" do
      let(:opts) { [1, 2, 3, 4, "x" ] }

      before { app.store = Store.new(2,2) }
      
      it "should invoke `store` on warehouse store" do
        expect(app.store).to receive(:store) do |crate, opts|
          expect(crate.product).to eq "x"
          expect(crate.width).to eq 3
          expect(crate.height).to eq 4
          location = opts[:at]
          expect(location.x).to eq 1
          expect(location.y).to eq 2
        end

        subject.execute(opts)
      end
    end
  end
end
