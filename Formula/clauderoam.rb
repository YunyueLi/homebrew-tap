class Clauderoam < Formula
  desc "Your Claude Code config, anywhere. Across Macs. Across accounts."
  homepage "https://github.com/YunyueLi/ClaudeRoam"
  url "https://github.com/YunyueLi/ClaudeRoam/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "c03b61571d461332d0e9ff3c2c941e21194ecf943d0f82ca51af35c2172671b2"
  license "MIT"
  version "0.6.1"

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
      Docs: https://github.com/YunyueLi/ClaudeRoam
    EOS
  end

  test do
    assert_match "clauderoam #{version}", shell_output("#{bin}/clauderoam version")
    assert_match "USAGE", shell_output("#{bin}/clauderoam help")
  end
end
