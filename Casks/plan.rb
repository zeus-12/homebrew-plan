cask "plan" do
  # version and sha256 are rewritten by the release workflow in zeus-12/plan.
  version "0.6.2"
  sha256 "a676a73b5011d7a61aa31f3be207d805cb50f18b2e08733cb51a93594d39df2a"

  url "https://github.com/zeus-12/plan/releases/download/v#{version}/Plan-#{version}-arm64.dmg"
  name "Plan"
  desc "Cockpit for reviewing and driving terminal coding agents"
  homepage "https://github.com/zeus-12/plan"

  # The release DMG is arm64-only; Electron 35 drops everything below Big Sur.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Plan.app"

  # Plan is ad-hoc signed (no Apple Developer ID, not notarized), so macOS quarantines
  # the download. Strip the flag on install and upgrade so Gatekeeper lets it launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Plan.app"]
  end

  # Quit the running app before Homebrew replaces the bundle on upgrade or uninstall.
  uninstall quit: "com.plan.desktop"

  # ~/.plan is deliberately absent: it holds the user's worktrees, notes and scratch files.
  zap trash: [
    "~/Library/Application Support/Plan",
    "~/Library/Caches/com.plan.desktop",
    "~/Library/Preferences/com.plan.desktop.plist",
    "~/Library/Saved Application State/com.plan.desktop.savedState",
  ]
end
