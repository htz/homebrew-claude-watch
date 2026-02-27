cask "claude-watch" do
  version "0.0.4"
  sha256 "b1da135078c8556a50f70d615098cc2b39aba89c0be2f0aa36e2592fcca5d5f2"

  url "https://github.com/htz/claude-watch/releases/download/v#{version}/claude-watch-darwin-arm64-#{version}.zip"
  name "Claude Watch"
  desc "macOS menu bar app for Claude Code permission notifications"
  homepage "https://github.com/htz/claude-watch"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  preflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/Claude Watch.app"]
  end

  app "Claude Watch.app"

  zap trash: "~/.claude-watch"
end
