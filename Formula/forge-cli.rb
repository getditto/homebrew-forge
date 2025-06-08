class ForgeCli < Formula
  desc "CLI tool for Forge Workflow - build and deploy JavaScript/WASM functions"
  homepage "https://forgeapp.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    else
      url "https://github.com/getditto/homebrew-forge/releases/download/v#{version}/forge-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "forge"
    
    # Install shell completions
    generate_completions_from_executable(bin/"forge", "completions")
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
