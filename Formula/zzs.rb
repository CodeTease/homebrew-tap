class Zzs < Formula
  desc "A fancy sleep command written in Rust 💤"
  homepage "https://github.com/CodeTease/zzz"
  version "0.3.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.3.0/zzs-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b5813d7114dfbe97259b75bcbfadb3511cdd773788684442e8095d4f73d3f11"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.3.0/zzs-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d68cb16ec85642e0195f95048da9adbe14840cb1df016dca92e424e45d2ac35"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/zzz/releases/download/v0.3.0/zzs-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "416bb58efc8b98b56e4c2ca2337ac02d98e53336f545ac304a40cd47614307ca"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/zzz/releases/download/v0.3.0/zzs-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "582931697cc6a8753d0d9d98ce8fe0d76ace5963476017d81eaf48aec8b74217"
    end
  end

  def install
    bin.install "zzs"
  end
end
