class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.0.0.tgz"
  sha256 "26517d43871c6c089d92abb00f5f1bad1040fa96"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink libexec/"bin/md-server"
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end
