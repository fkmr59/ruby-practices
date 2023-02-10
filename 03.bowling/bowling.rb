#!/usr/bin/env ruby
# frozen_string_literal: true

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
shots = scores.map do |scores_string|
  if scores_string == 'X'
    10
  else
    scores_string.to_i
  end
end

# 投球（フレーム）ごとに分割
frames = (1..10).map do |frame_count|
  if frame_count < 10
    if shots[0] == 10
      shots.slice!(0, 1)
    else
      shots.slice!(0, 2)
    end
  else
    shots
  end
end

# スコアの合計する
# ストライクとスペアの判断
point = frames.each_with_index.sum do |frame, index|
  next frame.sum if index >= 9 || frame.sum != 10
  
  # ストライクなら次のフレームの1・2投目を足す
  if frame[0] == 10 # strike
    next_frame = frames[index + 1]
    # 連続ストライクなら次のフレームと次のフレーム次のを足す
    if next_frame == [10]
      after_next_frame = frames[index + 2]
      frame.sum + next_frame.sum + after_next_frame.first
    else
      next_frame_score = next_frame.first(2)
      frame.sum + next_frame_score.sum
    end
  # スペアなら次のフレームの1投目の足す
  elsif frame.sum == 10 # spare
    next_frame = frames[index + 1]
    frame.sum + next_frame.first
  end
end
puts point
