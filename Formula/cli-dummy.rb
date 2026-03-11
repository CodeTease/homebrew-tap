class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.3.0/cli-dummy-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "af689b220b745d01a28ae1cd9b52557aee0172680369d1e628feca7ee6d34f93"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.3.0/cli-dummy-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "28da2e723725897447ac7630ec58c6e3f05ffc44f41bc4f1b69d68f927ff0e3b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.3.0/cli-dummy-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b82cc1d2d994ad5f3806123cd92af0c69e93c86475b361258ce1f25d675f8e53"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.3.0/cli-dummy-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c444d95658cb43cb33b3779f083ada9c3ac150e60156657adbec43862a7fd96"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
