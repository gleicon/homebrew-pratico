cask "pratico" do
  version "0.2.27"
  sha256 "39d1b7b762f703eeec3f3a7a7b939f2746c0390df55d115dd9851a99f08f9d0f"

  url "https://github.com/gleicon/pratico/releases/download/v#{version}/Pratico-#{version}.dmg"
  name "Pratico"
  desc "Local container manager: each container in its own VM, Docker-compatible API"
  homepage "https://github.com/gleicon/pratico"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Pratico.app"

  # The optional boot job that links /var/run/docker.sock; the link itself is left alone,
  # since it may be another tool's, and macOS empties /var/run at boot.
  uninstall launchctl: [
              "dev.pratico.daemon",
              "dev.pratico.socket",
            ],
            quit:      "dev.pratico.menubar",
            delete:    "/Library/LaunchDaemons/dev.pratico.socket.plist"

  # Containers, images, and volumes live in ~/.pratico: --zap deletes them.
  zap trash: [
    "~/.pratico",
    "~/Library/LaunchAgents/dev.pratico.daemon.plist",
  ]

  caveats <<~EOS
    Pratico is not notarized by Apple yet: approve its first launch once in
    System Settings > Privacy & Security ("Open Anyway").

    `brew uninstall --zap pratico` also deletes ~/.pratico: every container,
    image, and volume.
  EOS
end
