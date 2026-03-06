class Taskcast < Formula
  desc "Unified long-lifecycle task tracking service for LLM streaming and async workloads"
  homepage "https://github.com/weightwave/taskcast"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7e8a6b6c3f0477f39be3c98ef76d5c0a0936ff84c73740343465eea37b15bb66"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5bbf0310ba099354bb4c365f669e262df85435f7681cf49840d601326735c417"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cbe638f4f75a98d8b6f51019bb29fef53573bb24cab3a6e444aaf0aa566b655"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47090e714cb9ee110561c85ee1272cdbc5637c2ff7ef91c8de860b2f685f8415"
    end
  end

  def install
    bin.install "taskcast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/taskcast --version")
  end
end
