class CliDummy < Formula
  desc "A dummy CLI tool"
  homepage "https://github.com/CodeTease/cli-dummy"
  version "0.4.6"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.6/cli-dummy-0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "d6ce37538582d03add4541ded7cc66dd15bb04ec3e362d6f0dde4adb1245bb56"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.6/cli-dummy-0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "da8413a8134db72b86c568f3adda1a8c9c14f4d93a021577d30d253d7755d635"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.6/cli-dummy-0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fd81f024c6f8c31cc4ba55d5edb33e6eb9cc9ace207f8b5a187ffd42cab89cf"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/cli-dummy/releases/download/v0.4.6/cli-dummy-0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b54f4017d5a3bdcde3db512896085b26c438634e2f09a6806a464c591cbdf930"
    end
  end

  def install
    bin.install "cli-dummy"
  end
end
