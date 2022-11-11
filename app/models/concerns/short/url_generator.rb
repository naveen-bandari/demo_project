# frozen_string_literal: true

module Short
  class UrlGenerator
    def self.generate_short_url(original_url)
      response = Faraday.post('https://api.short.io/links') do |req|
        req.params['limit'] = 100
        req.headers['Content-Type'] = 'application/json'
        req.headers['authorization'] = 'sk_cjOYIT5oaOkAotKo'
        req.body = { 'domain': '1wm0.short.gy', 'originalURL': original_url }.to_json
      end

      return nil unless response.status == 200

      response = JSON response.body
      response['secureShortURL']
    end
  end
end
