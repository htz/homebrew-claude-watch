cask "claude-watch" do
  version "0.0.2"
  sha256 "a7f8a3f14de43000ea6111c040071e77ff189a18ae3d722bf28c5f0ef57b9a4d"

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
