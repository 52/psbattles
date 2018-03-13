require "net/http"

class ImgurValidator < ActiveModel::EachValidator
  def validate_each record, attribute, value
    url = URI.parse "https://i.imgur.com/#{value}.jpg"
    req = Net::HTTP.new url.host, url.port
    req.use_ssl = true
    res = req.request_head url.path
    if res.code == "200"
      unless res["content-type"] == "image/jpeg"
        record.errors[attribute] << "must be a jpeg image"
      end
    else
      record.errors[attribute] << "isn't a valid Imgur link"
    end
  end
end
