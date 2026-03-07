class Taskcast < Formula
  desc "Unified long-lifecycle task tracking service for LLM streaming and async workloads"
  homepage "https://github.com/weightwave/taskcast"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "58549c7c767679b9f2533d8fba916addc730d3904ce17a0a0ec2fed982de5567"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4018283ce815fe1dc8706e0be2cccde956801e85e2854818528ef54b481f7e2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "322bf10fc3b5a180abc4ab27df6d554b2c98b5c5b3a281c39d4b35a7ff4c3720"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd98207f6e329f04566b735a04b3292808ccdd2c2897706f85b8b5fe5574ca59"
    end
  end

  def install
    bin.install "taskcast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/taskcast --version")
  end
end
