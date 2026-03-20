class Bwd < Formula
  desc "A better pwd."
  homepage "https://github.com/CodeTease/bpwd"
  version "0.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.4.0/bwd-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "72d0182631cb72a133ac7ad4f583bd2f4efb50ae8c1ca76370a58d6a2ffccdf2"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.4.0/bwd-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "2780488bb6cfa1e6736c254a2b21cd521ae3224790da21433d0c7672eadd7d90"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.4.0/bwd-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66c5263600a2be5ffa7c9a5267ef770551813615bc657f62afa295d8b3c7e1b8"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.4.0/bwd-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1951ac7c8d3663952400326b836e36f85a02c2cccf216a8169849a1f1f586b8"
    end
  end

  def install
    bin.install "bwd"
  end
end
