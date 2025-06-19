class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.0.4.tgz"
  sha256 "4f2f2cc001f97fba55a1cdbcca4dd0f628751e8a8d0f133fe39de8e9c037fa49"
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