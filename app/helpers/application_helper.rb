module ApplicationHelper
  def syouhizei(n)
    # 小数点以下の四捨五入に対応するためにroundを記述
    (n * 1.1).floor.to_s(:delimited)
  end

end
