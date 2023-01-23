#!/usr/bin/env ruby
require 'date'
require 'optparse'

# 指定した年月を文字列で表現
def year_month_str(subject_date)
  output_string = subject_date.month.to_s + "月" + "\s" + subject_date.year.to_s
end
# 曜日を文字列として表現
def weeks_str
  "\s日\s月\s火\s水\s木\s金\s土"
end
# # 指定した年月の日数の取得
# def month_days(get_date)
#   # first_day = Date.new(get_date.year, get_date.month, 1)
#   last_day = Date.new(get_date.year, get_date.month, -1)

#   output_string = ""
#   output_string += year_month_str.center(21) + "\n"
#   output_string += weeks_str + "\n"
  
#   # 月頭の空白処理
#   output_string += "".rjust(3) * first_day.wday

#   # 取得した日数の月ごとの正規化
#   # 日数の繰り返し
#   (1..last_day).each do |day|
#     if day.wday == 6
#       output_string += day.day.to_s.rjust(3) + "\n"
#     else
#       output_string += day.day.to_s.rjust(3)
#     end
#   end
#   output_string
# end

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
if year_input > 0 
  run_date = Date.new(year_input , today.month)
elsif month_input > 0
  run_date = Date.new(today.year, month_input)
else
  run_date = today
end
p run_date
p year_month_str(run_date)
# 正規化した日数の表示
# puts month_days(run_date)
