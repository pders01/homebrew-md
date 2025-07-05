class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.1.2.tgz"
  sha256 "2ae29b74bda6af539c34cc145fea014e2c10de538454d0d3bc8456e0a4ad10a5"
  license "MIT"

  depends_on "node"

  def install
    system "tar", "-xzf", cached_download
    Dir.chdir("package") do
      # Install the CLI binary
      bin.install "dist/index.js" => "md-server"
      
      # Install static assets and template
      libexec.install "dist/public"
      libexec.install "dist/template.html"
      libexec.install "dist/package.json"
    end
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end 