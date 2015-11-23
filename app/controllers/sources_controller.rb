class SourcesController < ApplicationController
  require 'single_comic_stream'
  layout false

  def list
    @sources = Source.all
  end

  def new

  end

  def comic
    comic_id = params[:id]
    @source = Source.find(comic_id)
    stream = SingleComicStream.new(@source)

    if(params[:nextUri])
      raw_html = stream.load_from_uri(params[:nextUri])
    else
      raw_html = stream.load_from_root(3)
    end

    regex = Regexp.new(@source.regexImage)
    @image = regex.match(raw_html).to_s
    logger.debug @image

    regex = Regexp.new(@source.regexNext)
    @nextLink = regex.match(raw_html)[1]

  end
end
