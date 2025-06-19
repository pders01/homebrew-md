class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.0.0.tgz"
  sha256 "c0c5e8d1d8547325d1a95dd51d45b573d67bf247174e3c4ccb4b43fcc7383559"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "@jpahd/md-server"
    
    # Find the CLI file in the installed package
    cli_path = "node_modules/@jpahd/md-server/cli.js"
    
    # Make sure the CLI file exists and is executable
    if File.exist?(cli_path)
      File.chmod(0755, cli_path)
      bin.install cli_path => "md-server"
    else
      # Fallback: try to find the binary in the package
      Dir.glob("node_modules/@jpahd/md-server/*.js").each do |file|
        if File.basename(file) == "cli.js" || File.basename(file) == "md-server.js"
          File.chmod(0755, file)
          bin.install file => "md-server"
          break
        end
      end
    end
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end
