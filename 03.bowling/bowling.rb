#!/usr/bin/env ruby
require 'optparse'

# コマンドラインの入力値（引数）を取り出す
opt = OptionParser.new

opt.on('')

opt.parse!(ARGV)
score = ARGV[0]
# 取得した引数を1投毎に分割する
score.split(",")
# 数値に変換
score = ARGV[0]
scores = score.split(",")
shots = []
scores.each do |s|
  if s == "X" # strike
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
  breack = 
end
# 最後のレーンを正規化と再配列
last_fram = frames[9..11]
last_scores = last_fram.flatten
last_score = last_scores.select do |x|
  x == 10
end

p last_score
p frames
# スコアの合計する
# ストライクとスペアの判断
# point = 0
# frames.each do |frame|
#   # ストライクなら次のレーンの1・2投目を足す
#   n = 0
#   if frame[n] == 10 # strike
#     point += frame.sum + frame[n += 1]
#   # スペアなら次のレーンの1投目の足す
#   elsif frame.sum == 10 # spare
#     point += frame[0] + 10
#   else
#     point += frame.sum
#   end
# end
# puts point