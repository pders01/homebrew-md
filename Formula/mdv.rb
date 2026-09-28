class Mdv < Formula
  desc "Terminal markdown viewer with vim keybindings, plus `mdv serve` HTTP mode"
  homepage "https://github.com/pders01/mdv"
  version "0.30.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-arm64.tar.gz"
      sha256 "7e651cf35b274fba6ff93877f5b1b36e0498a5103672ddeafd62f9ad2ca97212"
    end
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-darwin-x64.tar.gz"
      sha256 "322191419d07b530286ef3c76fe013040011436516b63d87fdd46b27c2ce8261"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pders01/mdv/releases/download/v#{version}/mdv-linux-x64.tar.gz"
      sha256 "15a35d0f09287e289d8625ba7e94456baa6f37a0c2eadad5b85cc5271bb85dca"
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
