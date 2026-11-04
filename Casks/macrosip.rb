cask "macrosip" do
  version "26.2.0"
  sha256 "2bb8dce7e19feac9a500ba383a7ce19484185d56c62cc94d4445289b8d2ec504"

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
