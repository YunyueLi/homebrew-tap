class Clauderoam < Formula
  desc "Your Claude Code config, anywhere — across Macs and accounts"
  homepage "https://github.com/YunyueLi/ClaudeRoam"
  url "https://github.com/YunyueLi/ClaudeRoam/archive/refs/tags/v0.6.2.tar.gz"
  version "0.6.2"
  sha256 "b7d484bb1ef6d439f0b0cbba18be593e6c44bdee857499033a46e5762f0f750d"
  license "MIT"

  depends_on "bash"
  depends_on "rsync"

  def install
    bin.install "clauderoam"
    pkgshare.install "CLAUDE.md",
                     "settings.json",
                     "agents",
                     "skills",
                     "commands",
                     "examples",
                     ".gitattributes",
                     ".gitignore"
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
