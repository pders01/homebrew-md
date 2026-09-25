class Mdv < Formula
  desc "Terminal markdown viewer with vim keybindings, plus `mdv serve` HTTP mode"
  homepage "https://github.com/pders01/mdv"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-arm64.tar.gz"
      sha256 "9c6dad99b4959cb0f3e95b85efa5c24f8cea9525d46e2dc552e2ad737cc67cb8"
    end
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-x64.tar.gz"
      sha256 "ad8ef1aaace870d7bd3a3ca87ca240b945a50bc8a383905e27807732954a8d5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-linux-x64.tar.gz"
      sha256 "1b64aa1b102268ded52983a9cc19c42a4e92857829c708a23dd45c5bf2d09b1a"
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
