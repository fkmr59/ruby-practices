#!/usr/bin/env ruby
require 'date'
require 'optparse'

# 指定した年月を文字列で表現
def year_month_str(subject_date)
  str_year_month = subject_date.month.to_s + "月" + "\s" + subject_date.year.to_s
end
# 曜日を文字列として表現
def weeks_str
  "\s日\s月\s火\s水\s木\s金\s土"
end
# 指定した年月の日数の取得
def month_days(get_date)
  # 指定した年月の最終日を文字列で取得
  last_day_str = Date.new(get_date.year, get_date.month, -1)
  # last_day_strを使って最終日を取得
  end_day = last_day_str.day
  # 月頭の空白処理
  output_string = ""
  output_string += "".rjust(3) * get_date.wday
  # output_string += year_month_str.center(21) + "\n"
  # output_string += weeks_str + "\n"
  
  # 取得した日数の月ごとの正規化
  # 日数の繰り返し
  (1..end_day).each do |day|
    if day.wday == 6
      output_string += day.day.to_s.rjust(3) + "\n"
    # else
    #   output_string += day.day.to_s.rjust(3)
    end
  end
  output_string
end

opt = OptionParser.new
option = {}

opt.on('-y [v]') {|v| option[:y] = v}
opt.on('-m [v]') {|v| option[:m] = v}

opt.parse!(ARGV)

# コマンドラインで入力された年月の数値化
year_input = option[:y].to_i
month_input = option[:m].to_i
# コマンドラインの入力がなかった時に現在の日にちをあてる
today = Date.today
# 入力値を使いdateを取得する
year = Date.today.year
month = Date.today.month
if year_input > 0
  year = year_input
end
if month_input > 0
  month = month_input
end
run_date = Date.new(year, month)

p run_date

# 年月の文字列の表示
puts year_month_str(run_date).center(21) + "\n"
# 正規化した日数の表示
puts month_days(run_date)
