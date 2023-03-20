# frozen_string_literal: true

def files_space_process(files)
  initial_value = 0
  files.each do |item|
    string_length = item.length
    initial_value = string_length if initial_value < string_length
  end
  files.map { |files_space_process| files_space_process.ljust(initial_value + 1) }
end

def one_column_items(items)
  column_count = 3
  one_column_items = items.each_slice(items.length.div(column_count) + 1).to_a
  if one_column_items.last.length == column_count
    one_column_items.transpose
  else
    (one_column_items.first.length - one_column_items.last.length).times do
      one_column_items.last.push(nil)
    end
    one_column_items
  end
end

def output_row_items(columns)
  columns.transpose.each do |row|
    row.compact!
    output = ''
    row.each do |item|
      output += item
    end
    puts output
  end
end

# ディレクトリに存在するファイルの取得
files = Dir.glob('*')
# 空白処理
items = files_space_process(files)
# # 1列の要素数
columns = one_column_items(items)
# # 1行の要素数を出力
output_row_items(columns)
