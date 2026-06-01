# typed: false
# frozen_string_literal: true

# Symphony has been renamed to Detent. Install `detent` instead:
#   brew install digitaldrywood/tap/detent
class Symphony < Formula
  desc "Agent orchestrator for tracker-backed work queues (renamed to detent)"
  homepage "https://github.com/digitaldrywood/detent"
  version "0.1.1"
  license "MIT"

  deprecate! date: "2026-05-31", because: "it has been renamed to `detent`; run `brew install digitaldrywood/tap/detent`"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/digitaldrywood/symphony/releases/download/v0.1.1/symphony_0.1.1_darwin_amd64.tar.gz"
      sha256 "38f227e503befb3f0142e9a66eac60be61886cbf8920677741b4cb3492f93c67"

      define_method(:install) do
        bin.install "symphony"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/digitaldrywood/symphony/releases/download/v0.1.1/symphony_0.1.1_darwin_arm64.tar.gz"
      sha256 "81abb7716f2ae8ac4096c0fc40da7444597e13a48e2e3cb012262098ba14da22"

      define_method(:install) do
        bin.install "symphony"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/digitaldrywood/symphony/releases/download/v0.1.1/symphony_0.1.1_linux_amd64.tar.gz"
      sha256 "95edfa260acd2433109a013ecf40943947e97833fdfabe93ae375a38e3918ac6"
      define_method(:install) do
        bin.install "symphony"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/digitaldrywood/symphony/releases/download/v0.1.1/symphony_0.1.1_linux_arm64.tar.gz"
      sha256 "687c9852eb3b5fd0a3e691bfe665c61c23a67db0f7d2c99596d3ee8aa1902c6c"
      define_method(:install) do
        bin.install "symphony"
      end
    end
  end

  test do
    system "#{bin}/symphony", "--version"
  end
end
