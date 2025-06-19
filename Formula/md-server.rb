class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  version "1.0.0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "-g", "@jpahd/md-server"
    # Symlink the installed binary into Homebrew's bin
    bin.install_symlink Dir[HOMEBREW_PREFIX/"lib/node_modules/@jpahd/md-server/cli.js"] => "md-server"
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end
