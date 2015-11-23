class SingleComicStream
  require 'net/http'
  require 'rest-client'

  def initialize(source)
    @source = source
  end

  def load_from_uri(nextUri)
    res = RestClient.get @source.baseUri + nextUri
    res.to_str
  end

  def load_from_root(max)
    res = RestClient.get @source.baseUri
    res.to_str
  end
end