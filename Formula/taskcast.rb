class Taskcast < Formula
  desc "Unified long-lifecycle task tracking service for LLM streaming and async workloads"
  homepage "https://github.com/weightwave/taskcast"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a1e7c57e7c7532c8e96aecd9b0a2e233143794a929a4b91668dff9eea35a58e0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "02139fc84b7ff1abc60bb0bf940a4b22dc6537fec79264be16183613e807def4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73b70cdcacde80f7aabadbec757dc3054d43c2ab3a4d755b2a59c186b0be9be9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a037e40d354879f66a3117458236eb535c694d7ba131b41cf04a07aaeb886ccb"
    end
  end

  def install
    bin.install "taskcast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/taskcast --version")
  end
end
