class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.4.5"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.5/cli-dummy-0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "e7bc68aa057d66333073ace1bf1ec60cea09045662bf370b6850614118bfda7a"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.5/cli-dummy-0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "31d7f3de17fac24635ab4eb54469ac05f7e31e5ad10bd15ed90a00a622814444"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.5/cli-dummy-0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b661e6e949e5766f1bbe7fe32fea2779438146cf448bef2ec3e9d4127bd2221"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.5/cli-dummy-0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4045d4fefecaf8cf690e9e0b89f3f18a162e4706a5f406efb8f7fdba789470e4"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
