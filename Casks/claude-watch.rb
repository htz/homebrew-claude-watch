cask "claude-watch" do
  version "0.0.14"
  sha256 "ca0a6ac1f14a59bd53df561e614de57543a9487f1aa43a6f3997fac3aa9b3db7"

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

  caveats <<~EOS
    初期セットアップ:
      1. Claude Watch を起動してください:
         open -a "Claude Watch"

      2. Claude Code のフックを登録してください:
         claude-watch-setup --all

      フック登録の対話式メニュー:
         claude-watch-setup

      フックの削除:
         claude-watch-setup --remove

      詳細: https://github.com/htz/claude-watch
  EOS

  binary "#{appdir}/Claude Watch.app/Contents/Resources/hooks/claude-watch-setup"

  zap trash: "~/.claude-watch"
end
