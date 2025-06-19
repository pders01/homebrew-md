class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://github.com/pders01/md.git", branch: "main"
  version "1.0.0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install"
    system "npm", "run", "build"
    bin.install "dist/md-server.js" => "md-server"
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end 