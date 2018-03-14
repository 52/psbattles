require "net/http"

class ImgurValidator < ActiveModel::EachValidator
  IMGUR = %r{\A(https?://)?(m\.)?(?(2)|(i\.)?)imgur\.com/(\w+)(\.jpg)?\z}

  def validate_each record, attribute, value
    # check link format
    if match_result = value.strip.match(IMGUR)
      imgur_hash = match_result[4]
      image_link = "https://i.imgur.com/#{imgur_hash}.jpg"

      url = URI.parse image_link
      req = Net::HTTP.new url.host, url.port
      req.use_ssl = true
      res = req.request_head url.path

      # check link exists
      if res.code == "200"
        # check image type
        if res["content-type"] == "image/jpeg"
          record[attribute] = image_link
        else
          record.errors[attribute] << "must be a jpeg image"
        end
      else
        record.errors[attribute] << "does not exist or is no longer available"
      end
    else
      record.errors[attribute] << "isn't a valid Imgur link"
    end
  end
end
