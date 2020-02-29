json.array! @blacklists do |blacklist|
  json.extract! blacklist, :website_name, :website_url
end
