class Zzz < Formula
  desc "A fancy sleep command written in Rust 💤"
  homepage "https://github.com/CodeTease/zzz"
  version "0.1.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.1.0/zzz-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "30532c94e8c0f293d894d53b8f78da8c932270c8325a57d556d10b71767d8943"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.1.0/zzz-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e96a0ee200a8ad91285f71ca6422bd78dc3071babd59128f78caa7a41ee0ea5"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.1.0/zzz-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac73dba0b8cb32f82e0f7572ef1b12861f690b4aded16fcdeb0588c01735a8e6"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.1.0/zzz-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f10da3532bf9af37eaabf2432b5fa56d25f565a85834b88f3883c4a99f85ada"
    end
  end

  def install
    bin.install "zzz"
  end
end
