class Zzz < Formula
  desc "A fancy sleep command written in Rust 💤"
  homepage "https://github.com/CodeTease/zzz"
  version "0.2.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.2.0/zzz-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a6a3f13a29a707ed7dbc56ca628d2fb30af5af96b7b1f9748d18ba1374730ca1"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.2.0/zzz-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "9edce9acff91eaf31308109d459a0a3f2eb74067ae1a2e89c79bda6c681cd587"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.2.0/zzz-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26bcbf3a749911d9ed84831f52ac8dfa39840f313056df09f4e80aa9d6c4f1b2"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.2.0/zzz-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42d5bb60fcdff0bb59f83533c6cda8403822470050f8fc3ebcc0a0b63d69eda7"
    end
  end

  def install
    bin.install "zzz"
  end
end
