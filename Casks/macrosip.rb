cask "macrosip" do
  version "26.0.0"
  sha256 "5dafc3b672a3e93fd756fe226bbd2bdbb1122ca8957d302519dbc2cd2f959079"

  url "https://github.com/HSMM/MacroSIP/releases/download/#{version}/MacroSIP-#{version}.dmg"
  name "MacroSIP"
  desc "SIP softphone"
  homepage "https://github.com/HSMM/MacroSIP"

  auto_updates true
  depends_on macos: :sonoma

  app "MacroSIP.app"

  zap trash: [
    "~/Library/Application Support/MacroSIP",
    "~/Library/Caches/com.hsmm.macrosip",
    "~/Library/Logs/MacroSIP",
    "~/Library/Preferences/com.hsmm.macrosip.plist",
  ]

  caveats <<~EOS
    MacroSIP is signed ad hoc, not notarized. On first launch macOS may refuse to open it.
    Either right-click the app in /Applications and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/MacroSIP.app
  EOS
end
