class WordPresenter

  def initialize(word)
    @word = word
  end

  def validate_word
    conn = Faraday.new('https://od-api.oxforddictionaries.com') do |faraday|
      faraday.headers['app_id'] = ENV['APP_ID']
      faraday.headers['app_key'] = ENV['APP_KEY']
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/inflections/en/#{@word}")
    display_message(response)
  end

  def display_message(response)
    if response.env.status == 404
      "'#{@word}' is not a valid word."
    elsif response.env.status == 200
      "‘#{@word}’ is a valid word and its root form is ‘#{JSON.parse(response.body, symbolize_names: true)[:results][0][:lexicalEntries][0][:inflectionOf][0][:text]}’."
    end
  end
end
