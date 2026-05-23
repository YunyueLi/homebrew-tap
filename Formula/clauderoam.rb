class Clauderoam < Formula
  desc "Your Claude Code config, anywhere. Across Macs. Across accounts."
  homepage "https://github.com/YunyueLi/clauderoam"
  url "https://github.com/YunyueLi/clauderoam/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "9b618cd6fee26207a7c458586e024d511f744f0a5646cc3794e9098f3efdd215"
  license "MIT"
  version "0.5.0"

  depends_on "bash"
  depends_on "rsync"

  def install
    bin.install "clauderoam"
    pkgshare.install "CLAUDE.md",
                     "settings.json",
                     "agents",
                     "skills",
                     "commands",
                     "examples"
    doc.install "README.md", "README.zh-CN.md", "docs", "LICENSE", "CONTRIBUTING.md"
  end

  def caveats
    <<~EOS
      Run `clauderoam init` to set up your config repo.
      Docs: https://github.com/YunyueLi/clauderoam
    EOS
  end

  test do
    assert_match "clauderoam #{version}", shell_output("#{bin}/clauderoam version")
    assert_match "USAGE", shell_output("#{bin}/clauderoam help")
  end
end
