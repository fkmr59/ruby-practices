#!/usr/bin/env ruby
require 'optparse'

# コマンドラインの入力値（引数）を取り出す
opt = OptionParser.new

opt.on('')

opt.parse!(ARGV)
score = ARGV[0]
# 取得した引数を1投毎に分割する
score.split(',')
# 数値に変換
score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X' # strike
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end
# 投球（フレーム）ごとに分割
frames = []
shots.each_slice(2) do |s|
  frames << s
end
# 合計する
point = 0
frames.each do |frame|
  point += frame.sum
end
puts point
# スペアとストライクを加算
