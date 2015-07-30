require "no_nonsense_currency_converter/version"

module NoNonsenseCurrencyConverter

  # BASE_URL      = 'https://www.google.com/'
  BASE_URL      = 'https://api.fixer.io/'
  CONVERTER_URL = 'latest'
  # CONVERTER_URL = 'finance/converter'

  @@rate_hash   = {}

  def self.get_converted_currency_value(from_currency, to_currency, amount, force=false)
    from_currency = from_currency.upcase
    to_currency   = to_currency.upcase
    return amount if from_currency == to_currency
    rate =
        if (@@rate_hash[from_currency].try(:[], to_currency).present?) && !force
          @@rate_hash[from_currency][to_currency]
        else
          conversion_rate = get_raw_data(from_currency, to_currency)
          @@rate_hash[from_currency].present? ? @@rate_hash[from_currency].merge!({ to_currency => conversion_rate }) : @@rate_hash[from_currency] = { to_currency => conversion_rate }
          conversion_rate
        end
    (rate * amount.to_f).to_f.round(2)
  end

  private
  def self.get_raw_data(from, to)
    # open("#{BASE_URL}#{CONVERTER_URL}?a=#{amount}&from=#{from.upcase}&to=#{to.upcase}")
    uri  = URI("#{BASE_URL}#{CONVERTER_URL}?symbols=#{to}&base=#{from}")
    data = Net::HTTP.get(uri)
    JSON.parse(data)['rates'][to]
  end

  def self.get_final_parsed_amount(data)
    # data.read.scan(/<span class=bld>(\d+\.?\d*) [A-Z]{3}<\/span>/).flatten.first
    JSON.parse(data)['rate']['']
  end
end
