cask "clawbar" do
  version "1.0.0"
  sha256 "e3fcb3d3a6e45f98b5a89954fbd270a94a97434e433f11728f2034a0d75fa6bf"

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
