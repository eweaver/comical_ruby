class Source < ParseResource::Base;
  fields :baseUri, :isCollection, :itemFormat, :lastUri, :name, :regexAlt, :regexImage,
         :regexNext, :regexPrevious, :regexTitle, :type, :useWebView, :createdAt, :updatedAt
end