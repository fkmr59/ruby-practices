#!/usr/bin/env ruby
require 'optparse'

# コマンドラインの入力値（引数）を取り出す
opt = OptionParser.new

opt.on('')

opt.parse!(ARGV)
score = ARGV[0]
# 取得した引数を1投毎に分割する
p score.split(',')

# 数字に変換
# 投球（フレーム）ごとに分割
# 合計する
# スペアとストライクを加算
