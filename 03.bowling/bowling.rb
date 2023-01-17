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
end

p frames

# スコアの合計する
# ストライクとスペアの判断
point = 0
frames.each_with_index do |frame, index|
  # ストライクなら次のレーンの1・2投目を足す
  if frame[0] == 10 # strike
    f = frames[index+1]
    point = frame.sum + f(0)
    # p index
    # p f
  # スペアなら次のレーンの1投目の足す
  elsif frame.sum == 10 # spare
    f = frames[index+1]
    # p index
    # p f
  else
    point += frame.sum
  end
end
puts point