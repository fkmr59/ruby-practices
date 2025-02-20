#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'optparse'

def output_year_month_week(subject_data)
  year_month = "#{subject_data.month}月 #{subject_data.year}"
  weeks = "\s日\s月\s火\s水\s木\s金\s土"
  puts "#{year_month.center(20)}\n#{weeks.center(1)}"
end

# 指定した年月の日数データを週ごとに表示
def output_weeks_day(insert_data)
  # 指定した年月の最終日を文字列で取得
  last_day = Date.new(insert_data.year, insert_data.month, -1)
  # 月頭の空白処理
  output_string = ''.rjust(3) * insert_data.wday
  # 取得した日数を1週間ごとに繰り返し
  (1..last_day.day).each do |day|
    output_string += day.to_s.rjust(3)
    # 空白の個数と変数dayを足した数が7倍数であることを判断する
    output_string += "\n" if ((insert_data.wday + day) % 7).zero?
  end
  puts output_string
end

opt = OptionParser.new
option = {}

opt.on('-y [v]') { |v| option[:y] = v }
opt.on('-m [v]') { |v| option[:m] = v }

opt.parse!(ARGV)

# コマンドラインで入力された年月の数値化
year_input = option[:y].to_i
month_input = option[:m].to_i
# コマンドラインの入力値がない時は現在の日にちをあてる
# コマンドラインの入力値を使いdateを取得する
year = option[:y].nil? ? Date.today.year : year_input
month = option[:m].nil? ? Date.today.month : month_input

run_data = Date.new(year, month)

output_year_month_week(run_data)
output_weeks_day(run_data)
