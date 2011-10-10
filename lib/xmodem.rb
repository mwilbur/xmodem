class Xmodem
  SOH = 0x1
  attr_accessor :remote
  def start_tx
    ch = remote.getc until ch=="C"
    remote.putc(SOH)
  end
end