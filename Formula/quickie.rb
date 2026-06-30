class Quickie < Formula
  desc "Menubar explain-this sidecar — Hammerspoon UI + Python core, subscription CLIs"
  homepage "https://github.com/oyaah/quickie"
  # Private repo: clone via git (uses your GitHub credentials), not a tarball.
  url "https://github.com/oyaah/quickie.git", using: :git, tag: "v0.1.0", revision: "dabee3bea98b4855b4523c019a63b3d29725fb26"
  license "MIT"

  depends_on cask: "hammerspoon"

  def install
    libexec.install Dir["*"]
    (bin/"quickie").write_env_script libexec/"bin/quickie", QUICKIE_PREFIX: libexec
  end

  def caveats
    <<~EOS
      Finish setup:
        quickie setup           # link Hammerspoon config, register the Stop hook, seed config
      Then grant Accessibility to Hammerspoon (System Settings > Privacy & Security >
      Accessibility) and reload Hammerspoon. The 💡 menubar icon (top-right) and the
      global hotkey (default Cmd-Alt-Space) will then work.

      Backends use your existing subscriptions — sign in once:
        claude   (already signed in if you use Claude Code)
        codex login
    EOS
  end

  test do
    assert_match "quickie", shell_output("#{bin}/quickie --help")
  end
end
