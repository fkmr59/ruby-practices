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
scores.each do |scores_string|
  shots << if scores_string == 'X' # strike
             10
           else
             scores_string.to_i
           end
end
# 投球（フレーム）ごとに分割
frames = []
(1..10).each do |frame_count|
  frame_index = frame_count - 1
  frames[frame_index] = if frame_count < 10
                          if shots[0] == 10
                            shots.slice!(0, 1)
                          else
                            shots.slice!(0, 2)
                          end
                        elsif shots[0] == 10
                          shots.slice!(0, 3)
                        elsif shots.slice(0, 2).sum == 10
                          shots.slice!(0, 3)
                        else
                          shots.slice!(0, 2)
                        end
end
# スコアの合計する
# ストライクとスペアの判断
point = 0
frames.each_with_index do |frame, index|
  if index <= 8
    # ストライクなら次のフレームの1・2投目を足す
    if frame[0] == 10 # strike
      next_frame = frames[index + 1]
      # 連続ストライクなら次のフレームと次のフレーム次のを足す
      if next_frame == [10]
        after_next_frame = frames[index + 1]
        point += (frame.sum + next_frame.sum + after_next_frame.sum)
      else
        next_frame_score = next_frame.first(2)
        point += (frame.sum + next_frame_score.sum)
      end
    # スペアなら次のフレームの1投目の足す
    elsif frame.sum == 10 # spare
      next_frame = frames[index + 1]
      point += (frame.sum + next_frame.first)
    else
      point += frame.sum
    end
  else
    point += frame.sum
  end
end
puts point
