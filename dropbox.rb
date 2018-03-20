require 'dotenv/load'
require 'dropbox_api'

module Dropbox

  # uses ENV DROPBOX_OAUTH_BEARER
  @client = DropboxApi::Client.new

  def self.prices_list
    @client.search("prices").matches.map { |result| result.resource.name }
  end

  """
  reads a file prices.csv and saves it to dropbox, suffixed by the count
  eg. prices.csv locally -> prices_20.csv on dropbox
  """
  def self.upload_prices
    num = self.prices_list.size
    f = IO.read("prices.csv")
    res = @client.upload("/prices_#{num+1}.csv", f)
    puts "Dropbox uploaded file to #{res.path_display}"
  end

end
