# frozen_string_literal: true

def space_file_array(file_array)
  initial_value = 0
  file_array.each do |item|
    string_length = item.length
    initial_value = string_length if initial_value < string_length
  end
  file_array.map { |space_file_array| space_file_array.ljust(initial_value + 1) }
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
items = space_file_array(file_array)
# # 1列の要素数
columns = one_column_items(items)
# # 1行の要素数を出力
output_row_items(columns)
