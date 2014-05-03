require "no_nonsense_currency_converter/version"

module NoNonsenseCurrencyConverter

  BASE_URL      = 'https://www.google.com/'
  CONVERTER_URL = 'finance/converter'

  def self.get_converted_currency_value(from, to, amount)
    data = get_raw_data(amount, from, to)
    get_final_parsed_amount(data).to_f.round(2)
  end

  private

  def self.get_raw_data(amount, from, to)
    open("#{BASE_URL}#{CONVERTER_URL}?a=#{amount}&from=#{from.upcase}&to=#{to.upcase}")
  end

  def self.get_final_parsed_amount(data)
    data.read.scan(/<span class=bld>(\d+\.?\d*) [A-Z]{3}<\/span>/).flatten.first
  end
end
