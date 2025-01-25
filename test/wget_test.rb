require "test_helper"

describe Wget do
  it "has a version number" do
    refute_nil ::Wget::VERSION
  end

  describe ".call" do
    let(:filename) { "test.md" }
    let(:root) { File.expand_path("../..", __FILE__) }
    let(:filename) { File.join(root, "tmp", "test.md") }
    let(:tmp_dir) { File.dirname(filename) }
    let(:url) { "https://raw.githubusercontent.com/widefix/actual_db_schema/refs/heads/main/README.md" }

    before do
      FileUtils.mkdir_p(File.dirname(filename))
      FileUtils.rm_rf(filename)
    end

    it "downloads a file" do
      Wget.call(url, filename)
      assert File.exist?(filename)
    end

    it "raises an error if the URL is invalid" do
      assert_raises Wget::Error do
        Wget.call("invalid_url", filename)
      end
    end

    it "raises an error if the URL is unreachable" do
      assert_raises Wget::Error do
        Wget.call("http://localhost:9999", filename)
      end
    end

    it "raises an error if the URL is unreachable" do
      assert_raises Wget::Error do
        Wget.call("https://raw.githubusercontent.com/test.md", filename)
      end
    end
  end
end
