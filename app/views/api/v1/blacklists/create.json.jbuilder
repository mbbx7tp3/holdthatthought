json.array! @updated_blacklists do |blacklist|
  json.extract! blacklist, :id, :website_name, :website_url
end
