class ForgeCli < Formula
  desc "CLI tool for Forge Workflow - build and deploy JavaScript/WASM functions"
  homepage "https://forgeapp.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-aarch64-apple-darwin.tar.gz"
      sha256 "dcf96d09ef41700cc2256f53828b8534126a26fc73dc7f238d0c28432d219c60"
    else
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-x86_64-apple-darwin.tar.gz"
      sha256 "fa39180f880d40bf3327eeabde1a1c99597a173b3c990cb4b0af5b3ca82e6c2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "397f8992813ccf3125bde8fa0e41c779d009661812879adf4db9778567674f94"
    else
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f61a06a0b551b31247cd53bdb4c3889363e6979d0a98054c8180dc6fddb1bb34"
    end
  end

  def install
    bin.install "forge"
  end

  def caveats
    <<~EOS
      Forge CLI has been installed!
      
      To get started:
        forge auth login
      
      The CLI defaults to https://forgeapp.dev but you can override with:
        export FORGE_API_URL=https://your-instance.com/api
      
      Javy is bundled for JavaScript to WASM compilation.
      No additional installation required!
    EOS
  end

  test do
    assert_match "Forge CLI", shell_output("#{bin}/forge --version")
  end
end
