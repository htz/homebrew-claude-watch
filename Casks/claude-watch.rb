cask "claude-watch" do
  version "0.0.1"
  sha256 "14d3d04a9e1a6a62f026163492ff3c2d7a9de024af38dbb1531f08d638f3e254"

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
