class Clauderoam < Formula
  desc "Your Claude Code config, anywhere. Across Macs. Across accounts."
  homepage "https://github.com/YunyueLi/clauderoam"
  url "https://github.com/YunyueLi/clauderoam/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "ff2be9d2d4d6a7b22e41b0d4d04e98c26b67f144893b3c4622c9b83e4025aebc"
  license "MIT"
  version "0.4.1"

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
      To set up your config repo, run:
        clauderoam init

      By default this creates ~/clauderoam/. Override with:
        export CLAUDEROAM_DATA=/path/to/your/config-repo

      Then push to GitHub so other devices can pull it:
        cd ~/clauderoam
        gh repo create clauderoam --private --source=. --remote=origin --push

      On another machine:
        brew install YunyueLi/tap/clauderoam
        git clone <your-repo> ~/clauderoam
        clauderoam install

      Docs: https://github.com/YunyueLi/clauderoam
    EOS
  end

  test do
    assert_match "clauderoam #{version}", shell_output("#{bin}/clauderoam version")
    assert_match "USAGE", shell_output("#{bin}/clauderoam help")
  end
end
