class P < Formula
  desc "A task runner."
  homepage "https://github.com/CodeTease/p"
  version "0.2.0"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/p/releases/download/v0.2.0/p-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "bee301f52302443acb5a98ea8a3eece0ea37b6538b7e2d65d0ba6b4ff2c124d9"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/p/releases/download/v0.2.0/p-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "23175175a53ee08313dd95f59633b3d3b41598c48f546af83f86430812e53028"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/p/releases/download/v0.2.0/p-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46e6b35034dd31d9f40a96d8903c29af6a1df77cb301fcf37d79b61725e0ca49"
    elsif Hardware::CPU.arm?
      url "https://github.com/CodeTease/p/releases/download/v0.2.0/p-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19cac5021b7dc3a043e5a2af12139e938350cf930380c1dce184986eb3ebe607"
    end
  end

  def install
    bin.install "p"
  end
end
