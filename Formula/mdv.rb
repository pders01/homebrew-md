class Mdv < Formula
  desc "Terminal markdown viewer with vim keybindings, plus `mdv serve` HTTP mode"
  homepage "https://github.com/pders01/mdv"
  version "0.28.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-arm64.tar.gz"
      sha256 "7a4920b583b7ce96d5fc668ddcf567aeacc8aa82fb2326cbfff4179ba993c920"
    end
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-x64.tar.gz"
      sha256 "c072fa0d095b27ee12372db7e81f91cf2da67f271b5fceb39004bcf3f5c03c96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-linux-x64.tar.gz"
      sha256 "731838f2e527e143daaa4e249057fa5f1ad067c561f8f710f190e9e0767cad87"
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
