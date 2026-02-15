class Vegh < Formula
  desc "A lightweight, fast snapshot tool for developers."
  homepage "https://github.com/CodeTease/vegh"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/vegh/releases/download/v0.4.0/vegh-aarch64-apple-darwin.tar.xz"
      sha256 "51aae2b53f1ee0344075ceda22b23e7ca95612bafd60fa130cd76a57f3678444"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/vegh/releases/download/v0.4.0/vegh-x86_64-apple-darwin.tar.xz"
      sha256 "93b06b0eaf2d175d801986766f1a1d9772f3fc51f204cc5f0e8e7abd4289429b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/CodeTease/vegh/releases/download/v0.4.0/vegh-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ac6f5f4eb15f57070862c89c5e0f9f0bb7f608f9e026ac94af511f5f2d7e20e0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/CodeTease/vegh/releases/download/v0.4.0/vegh-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f7d496cf86554c08dc89a653d319468ac69ff204713494ab81b3d87703fcb47b"
    end
  end

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
    bin.install "vg" if OS.mac? && Hardware::CPU.arm?
    bin.install "vg" if OS.mac? && Hardware::CPU.intel?
    bin.install "vg" if OS.linux? && Hardware::CPU.arm?
    bin.install "vg" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
