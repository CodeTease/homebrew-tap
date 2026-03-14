class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.4.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.1/cli-dummy-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "6ef0ee1a1500927be854eefddd82cb4979816e29fbc523eedf4a1bf7363a62b6"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.1/cli-dummy-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "2de8096086c4777cd5e99ac894545c67bedfc3268cb281e60be9494de106e4f9"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.1/cli-dummy-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a2e542372d5ef79664674fc7f21ab9b1a35b0cf4a3c62f4163a2105d8403dbe"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.1/cli-dummy-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4f859211258e6b8d68ab8cae5c6a209d8edc8e5c2f8c7bcaf43e53a5ce9e028"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
