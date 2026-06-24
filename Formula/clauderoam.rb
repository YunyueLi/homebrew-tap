class Clauderoam < Formula
  desc "Your Claude Code config, anywhere. Across Macs. Across accounts."
  homepage "https://github.com/YunyueLi/ClaudeRoam"
  url "https://github.com/YunyueLi/ClaudeRoam/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7732461b563926caf965b2df9d6464433cb891fd0aaa35f91930c246ec1f70a1"
  license "MIT"
  version "0.6.0"

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
