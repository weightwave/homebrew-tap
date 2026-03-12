class Taskcast < Formula
  desc "Unified long-lifecycle task tracking service for LLM streaming and async workloads"
  homepage "https://github.com/weightwave/taskcast"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "08c396bad8c57947ee2a2e528c888eb8fc6ac9260889d594263e81503edb156c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4ab22ba2ab38a742924bc395fb44082c55a91c208e5c06d0992cb67473f45650"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8484f8432431f421ae54bc8346e4defbe8b8a2648d846ab14816c58600473b30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/weightwave/taskcast/releases/download/v#{version}/taskcast-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9fa69e8a47559f6e78ba5c467f3e278b5c17c069e597abce3b23768557cb92f"
    end
  end

  def install
    bin.install "taskcast"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/taskcast --version")
  end
end
