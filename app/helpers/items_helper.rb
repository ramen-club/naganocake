module ItemsHelper
  def number_with_delimiter(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
