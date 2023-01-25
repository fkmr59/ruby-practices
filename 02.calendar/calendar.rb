#!/usr/bin/env ruby
require 'date'
require 'optparse'

def output_year_month_day_of_week_str(subject_date)
  # 年月を文字列
  year_month = subject_date.month.to_s + "月" + "\s" + subject_date.year.to_s
  # 曜日の文字列
  weeks = "\s日\s月\s火\s水\s木\s金\s土"
  puts year_month.center(25) + "\n" + weeks.center(1)
end

# 指定した年月の日数データを週ごとに表示
def output_numdays_of_specified_year_month_foreach_week(insert_date)
  # 指定した年月の最終日を文字列で取得
  last_day = Date.new(insert_date.year, insert_date.month, -1)
  # 月頭の空白処理
  output_string = ''.rjust(3) * insert_date.wday
  # 取得した日数を1週間ごとに繰り返し
  (1..last_day.day).each do |day|
    output_string += day.to_s.rjust(3)
    # 空白の個数と変数dayを足した数が7倍数であることを判断する
    if (insert_date.wday + day) % 7 == 0
      output_string += "\n"
    end
  end
  puts output_string
end

opt = OptionParser.new
option = {}

opt.on('-y [v]') {|v| option[:y] = v}
opt.on('-m [v]') {|v| option[:m] = v}

opt.parse!(ARGV)

# コマンドラインで入力された年月の数値化
year_input = option[:y].to_i
month_input = option[:m].to_i
# コマンドラインの入力値がない時は現在の日にちをあてる
# コマンドラインの入力値を使いdateを取得する
if option == {}
  year = Date.today.year
  month = Date.today.month
else
  year = year_input
  month = month_input
end
run_date = Date.new(year, month)

output_year_month_day_of_week_str(run_date)
output_numdays_of_specified_year_month_foreach_week(run_date)
