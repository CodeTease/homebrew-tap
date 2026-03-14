class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.4.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.0/cli-dummy-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "bc46a18fc03945a88785c4c2ed078c604138dac3bad6450479b492a9be5e4461"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.0/cli-dummy-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "fd3370dd819049f72568d519d146760798c8932dad8614f65fc5a083f773ac82"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.0/cli-dummy-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1d0e9df4a840f121cdd27bddfc5366a6c2a362d1c0d39dd4f979de5ffff2e71"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.0/cli-dummy-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9df2c54fd6f045c55cfc1beb40fa8d9b391bfe772efb0d8351ea0693711e8006"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
