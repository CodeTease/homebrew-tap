class Pavidi < Formula
  desc "A task runner."
  homepage "https://github.com/CodeTease/p/blob/main/README.md"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/p/releases/download/v0.1.0/pavidi-aarch64-apple-darwin.tar.xz"
      sha256 "b1227ddb23333e26c78cd8e66c3ddc944a512e70c8b57829d9081ae5d3f5fafe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/p/releases/download/v0.1.0/pavidi-x86_64-apple-darwin.tar.xz"
      sha256 "2b1e81e217cdfc906218ae716dbe3da8e5f31ca0ee6c3a87642f4e8b81bd2bd9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/p/releases/download/v0.1.0/pavidi-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ac0f6d7bfde49264b2b2b1636291656cb94da064acd308dcb602d59b00984c7f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/p/releases/download/v0.1.0/pavidi-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "092b3376ee0415d42b135ddfe007cb6fa1b5d4e8f16a4cd5f8255947eb660d25"
    end
  end
  license "Apache-2.0"

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
    bin.install "p" if OS.mac? && Hardware::CPU.arm?
    bin.install "p" if OS.mac? && Hardware::CPU.intel?
    bin.install "p" if OS.linux? && Hardware::CPU.arm?
    bin.install "p" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
