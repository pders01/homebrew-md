class MdServer < Formula
  desc "A simple CLI tool that serves markdown files as HTML with beautiful Tailwind CSS styling"
  homepage "https://github.com/pders01/md"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.0.1.tgz"
  sha256 "ca98d622480b031103cedf42bfa17fbd386a780f035618774746c1ec942a4c2b"
  license "MIT"

  depends_on "node"

  def install
    system "tar", "-xzf", cached_download
    Dir.chdir("package") do
      bin.install "dist/index.js" => "md-server"
    end
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end
