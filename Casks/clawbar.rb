cask "clawbar" do
  version "1.0.0"
  sha256 "9c4ba8a2c76fcad1d3b6e1f4fd0c7e897c14572c486931e936d99ab600ebfd0b"

  url "https://github.com/blacki2016/Clawbar/releases/download/v#{version}/Clawbar-macOS.zip",
      verified: "github.com/blacki2016/Clawbar/"
  name "Clawbar"
  desc "Menu bar app and CLI for monitoring AI token usage"
  homepage "https://github.com/blacki2016/Clawbar"

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Clawbar.app"
  binary "#{appdir}/Clawbar.app/Contents/Helpers/clawbar", target: "clawbar"

  caveats do
    <<~EOS
      Clawbar installs the app into /Applications and links the CLI helper as `clawbar`.

      Run `clawbar --help` to get started.
    EOS
  end
end
