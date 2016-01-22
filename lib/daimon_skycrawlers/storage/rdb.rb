require "daimon_skycrawlers/storage/base"
require "active_record"

module DaimonSkycrawlers
  module Storage
    class RDB < Base
      def save
        ActiveRecord::Base.establish_connection(adapter: "sqlite3",
                                                database: "storage.db")
        Page.create(url: @url,
                    headers: @headers,
                    body: @body,
                    last_modified_at: @headers["Last-Modified"],
                    etag: @headers["ETag"])
      end

      class Page < ActiveRecord::Base
        self.table_name = "pages"
      end
    end
  end
end
