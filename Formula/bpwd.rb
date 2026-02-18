class Bpwd < Formula
  desc "A better pwd"
  homepage "https://github.com/CodeTease/bpwd"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.3.0/bpwd-aarch64-apple-darwin.tar.xz"
      sha256 "7c8f56ae23b8601c283357fce2a3ff173bdefd8595215122ec756dd1ccf5ce55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.3.0/bpwd-x86_64-apple-darwin.tar.xz"
      sha256 "7e850d246d70010b2f86fb5200b627c7add6195db6593e7950101009d1364066"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.3.0/bpwd-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ee45a5014a9ed0e1d96d7173c289a21a819fdb95800cd31e0e0f72d43adcbe73"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.3.0/bpwd-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2bf325ea571d201452ad348ac7bab61a3b7ce9a456fd60d5c321d0628cb3f8f8"
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
