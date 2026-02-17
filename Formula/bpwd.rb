class Bpwd < Formula
  desc "A better pwd"
  homepage "https://github.com/CodeTease/bpwd"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.0/bpwd-aarch64-apple-darwin.tar.xz"
      sha256 "5c2162c347369f247473c16a6ad182def765c2f052130d11db1b2a10db7645ab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.0/bpwd-x86_64-apple-darwin.tar.xz"
      sha256 "2d14c24c76ef3695a0f3fb869f17210b28870d6915082152bad1bb0eab903f8a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.0/bpwd-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "67b4dd8fab5482cd3f009ab50a724d82e4901ceca0a067fac1762e6ffb064738"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.0/bpwd-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "65b37e324e93065ff5b58ff4bfbd15413fcc0e06caf0a00dc1c776a52f62b711"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-pc-windows-gnu":            {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "bwd" if OS.mac? && Hardware::CPU.arm?
    bin.install "bwd" if OS.mac? && Hardware::CPU.intel?
    bin.install "bwd" if OS.linux? && Hardware::CPU.arm?
    bin.install "bwd" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
