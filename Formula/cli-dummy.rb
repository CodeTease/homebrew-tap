class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.5.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.5.0/cli-dummy-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "d6269852c5078328943d725a1f9a95414376fc4aa1bda3136ba0d1ebd8ff1ad1"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.5.0/cli-dummy-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "ee05e367d87083cc1020e9956eba55b05a8136b11581ced0eaa1f8b657403a93"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.5.0/cli-dummy-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16a9144b98b42c564ae3030e81eaae3c9f43f2349b37b936a550e74e57a9951b"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.5.0/cli-dummy-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b4effcb240d7a2e67660e28f3f51521e11ba65d45fa9fce94b35aeaaac9c535"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
