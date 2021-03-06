require "daimon_skycrawlers/storage/rdb"
require "daimon_skycrawlers/processor/base"

module DaimonSkycrawlers
  module Processor
    class Default < Base
      def call(message)
        return if message[:heartbeat]
        url = message[:url]
        page = storage.find(url)
        headers = JSON.parse(page.headers)
        headers_string = headers.map {|key, value| "  #{key}: #{value}" }.join("\n")
        dumped_message = <<LOG
URL: #{page.url}
Body: #{page.body.bytesize} bytes
Headers:
#{headers_string}
LOG
        log.info(dumped_message)
      end
    end
  end
end
