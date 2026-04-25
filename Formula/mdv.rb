class Mdv < Formula
  desc "Terminal markdown viewer with vim keybindings, plus `mdv serve` HTTP mode"
  homepage "https://github.com/pders01/mdv"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-arm64.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_ARM64_SHA256"
    end
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-x64.tar.gz"
      sha256 "REPLACE_WITH_DARWIN_X64_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-linux-x64.tar.gz"
      sha256 "REPLACE_WITH_LINUX_X64_SHA256"
    end
  end

  def install
    # Each platform tarball contains a single binary named for that platform.
    # Rename to `mdv` so the user's PATH gets a stable command regardless of
    # which artifact they downloaded.
    if OS.mac? && Hardware::CPU.arm?
      bin.install "mdv-darwin-arm64" => "mdv"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "mdv-darwin-x64" => "mdv"
    elsif OS.linux?
      bin.install "mdv-linux-x64" => "mdv"
    end
  end

  test do
    assert_match "mdv", shell_output("#{bin}/mdv --version")
  end
end
