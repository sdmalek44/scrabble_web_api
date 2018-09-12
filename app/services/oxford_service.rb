class OxfordService
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def valid_response?(response)
    response.env.status == 200
  end

  def word_root
    @response ||= conn.get("/api/v1/inflections/en/#{@word}")
    get_json(@response) if valid_response?(@response)
  end

  private

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:inflectionOf][0][:text]
  end

  def conn
    @conn ||= Faraday.new('https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV['APP_ID']
      faraday.headers['app_key'] = ENV['APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
