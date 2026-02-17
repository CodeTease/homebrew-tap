class Bpwd < Formula
  desc "A better pwd"
  homepage "https://github.com/CodeTease/bpwd"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.1.0/bpwd-aarch64-apple-darwin.tar.xz"
      sha256 "23600f7dbf91981aacc4f0efe9746a514d3f0984f23583de2cae680568d5e886"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.1.0/bpwd-x86_64-apple-darwin.tar.xz"
      sha256 "2b87260a61edce63dc31c348114962818696e74080f6edc1d16f29803ecabaf9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.1.0/bpwd-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f0aaf67af30c8be47a8a4a74ec1e9fc2c4ed868d174b4e401f64f3ae97494f85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/bpwd/releases/download/v0.1.0/bpwd-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cb508facc47f48a497bd5fa5a44b24089fd69978bbc04a95495bfdf3b028524d"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
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
