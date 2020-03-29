module ItemsHelper

  # 価格にカンマと円を付けるヘルパーメソッド
  def number_with_delimiter(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end

  # 税込価格を表示させるヘルパーメソッド。消費税は四捨五入で計算。
  def tax_included_price(price)
  	(price * 1.1).round
  end

end
