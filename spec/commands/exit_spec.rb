require "spec_helper"

describe Commands::Exit do
  let(:app) { double("app") }

  subject { Commands::Exit.new(app) }

  describe "#execute" do

    it "should invoke `stop` on application" do
      expect(app).to receive(:stop)
      subject.execute
    end
  end
end
