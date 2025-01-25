require "wget/version"
require "uri"
require "net/http"

module Wget
  Error = Class.new(StandardError)

  def self.call(url, output_filename)
    uri = URI.parse(url)
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
      request = Net::HTTP::Get.new(uri)

      http.request(request) do |response|
        raise Error, "Failed do download #{url} with http response code #{response.code}" unless response.is_a?(Net::HTTPSuccess)

        File.open(output_filename, "wb") do |file|
          response.read_body do |chunk|
            file.write(chunk)
          end
        end
      end
    end
  rescue Errno::ECONNREFUSED => e
    raise Error, "Failed to download #{url}: #{e.message}"
  end
end
