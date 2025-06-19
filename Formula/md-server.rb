class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.0.0.tgz"
  sha256 "c0c5e8d1d8547325d1a95dd51d45b573d67bf247174e3c4ccb4b43fcc7383559"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "@jpahd/md-server"
    bin.install_symlink "node_modules/@jpahd/md-server/cli.js" => "md-server"
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end
