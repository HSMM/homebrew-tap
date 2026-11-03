cask "macrosip" do
  version "26.1.0"
  sha256 "50d80374e991994f8689db1adfd2c40be5ab3163ab12890a77694d035940e621"

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
