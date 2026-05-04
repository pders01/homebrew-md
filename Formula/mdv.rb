class Mdv < Formula
  desc "Terminal markdown viewer with vim keybindings, plus `mdv serve` HTTP mode"
  homepage "https://github.com/pders01/mdv"
  version "0.26.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-arm64.tar.gz"
      sha256 "c639c823af1a7e6b263a08d0a21b83d4ec782fbae24ac8958043fcac48eab1c3"
    end
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-x64.tar.gz"
      sha256 "386ac7c82f2f8b6c5f06eb7399106ae65ebe48b5b4c320136793ef3dfff46155"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-linux-x64.tar.gz"
      sha256 "31d2c82b520f1c7ba31521a1cd24e80f731be52029fa7c3811b5c30be34fd7a7"
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
