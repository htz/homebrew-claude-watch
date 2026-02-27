cask "claude-watch" do
  version "0.0.5"
  sha256 "08e6e984242e48a44526b0a5e7686aaaf479c6a37e8f8c4d66ca87470d1d62f1"

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
