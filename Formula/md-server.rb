class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/@jpahd/md-server-1.0.0.tgz"
  sha256 "64b3b93329f02f2729bd7228e1e3317d68747f4b31125eb88e161136a0df0719"
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
