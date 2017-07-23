require "spec_helper"

describe Commands::Locate do
  let(:app) { SimpleWarehouse.new }
  subject { Commands::Locate.new(app) }

  it { should be_a Commands::Command }

  describe "#execute" do

    context "when no product is specified" do
      let(:opts) { [] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No product name specified")
      end
    end

    context "when no store is initialized" do
      let(:opts) { [ "p" ] }

      before { app.store = nil }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No store initialized")
      end
    end

    context "when store is initialized" do
      let(:opts) { [ "p" ] }

      before { app.store = Store.new(2,2) }

      it "should invoke `locate` on store for product" do
        expect(app.store).to receive(:locate).with(opts.first)
        subject.execute(opts)
      end
    end
  end
end
