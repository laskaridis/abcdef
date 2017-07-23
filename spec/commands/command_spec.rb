require "spec_helper"

describe Commands::Command do
  subject { Commands::Command.new(double("app")) }

  describe "#execute" do

    it "should print a default message" do
      expect(subject).to receive(:puts)
      subject.execute
    end
  end
end
