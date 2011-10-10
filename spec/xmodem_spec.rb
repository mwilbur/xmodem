require 'spec_helper'

describe "Xmodem" do
  describe "#start_tx" do

    it "should poll until it receives a 'C'" do
      remote = double("remote").as_null_object
      remote.should_receive(:getc).and_return("")
      remote.should_receive(:getc).and_return("X")
      remote.should_receive(:getc).and_return("F")
      remote.should_receive(:getc).and_return("C")

      xmodem = Xmodem.new
      xmodem.remote = remote
      xmodem.start_tx
    end

    it "should send an SOH when it receives a 'C'" do
      remote = double("remote")
      remote.should_receive(:getc).and_return("C")
      remote.should_receive(:putc).with(Xmodem::SOH)

      xmodem = Xmodem.new
      xmodem.remote = remote
      xmodem.start_tx
    end
  end
end