class MdServer < Formula
  desc "DEPRECATED — merged into mdv; install with `brew install pders01/md/mdv`"
  homepage "https://github.com/pders01/mdv"
  url "https://registry.npmjs.org/@jpahd/md-server/-/md-server-1.1.2.tgz"
  sha256 "2ae29b74bda6af539c34cc145fea014e2c10de538454d0d3bc8456e0a4ad10a5"
  license "MIT"

  # Functionality moved into `mdv serve`. The formula stays installable so an
  # existing user's `brew upgrade` doesn't break, but Homebrew prints the
  # deprecation warning at install/upgrade time and the binary itself prints
  # the migration banner on every run.
  deprecate! date: "2026-04-25",
             because: "merged into mdv; install with `brew install pders01/md/mdv`"

  depends_on "node"

  def install
    system "tar", "-xzf", cached_download
    Dir.chdir("package") do
      bin.install "dist/index.js" => "md-server"
      libexec.install "dist/public"
      libexec.install "dist/template.html"
      libexec.install "dist/package.json"
    end
  end

  def caveats
    <<~CAVEATS
      md-server has been merged into mdv as `mdv serve`.

      Migrate with:
        brew install pders01/md/mdv
        brew uninstall md-server
    CAVEATS
  end

  test do
    system "#{bin}/md-server", "--help"
  end
end 