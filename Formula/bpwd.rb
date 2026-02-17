class Bpwd < Formula
  desc "A better pwd"
  homepage "https://github.com/CodeTease/bpwd"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.1/bpwd-aarch64-apple-darwin.tar.xz"
      sha256 "d481e30c787fbaab01c64d9fb4e9182f17fd85f245c22523c58c4442325de2f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.1/bpwd-x86_64-apple-darwin.tar.xz"
      sha256 "a737e9f1a8502d76b0f2994d606bbb5f1438bd14531614477989fab35e82d050"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.1/bpwd-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ec92cc4393011f09b8569d652b4e8ce0d30e1516b661010e5fbbd5f8920c6088"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.2.1/bpwd-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f1b7ecf8b88968c883a0076200bcfb4dae1d79ed5b0e577f0497eddafb38e039"
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
