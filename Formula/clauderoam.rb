class Clauderoam < Formula
  desc "Your Claude Code config, anywhere. Across Macs. Across accounts."
  homepage "https://github.com/YunyueLi/clauderoam"
  url "https://github.com/YunyueLi/clauderoam/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1131769c24c558a91066a966eea886b033f3304ff964436f782687e0189cacbe"
  license "MIT"
  version "0.4.0"

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
