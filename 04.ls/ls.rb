# frozen_string_literal: true

def adjust_string_length(files)
  right_join_space = 0
  files.each do |file|
    file_name_length = file.length
    right_join_space = file_name_length if right_join_space < file_name_length
  end
  files.map { |file| file.ljust(right_join_space + 1) }
end

def one_column_items(items)
  column_count = 3
  one_column_items = items.each_slice(items.length.div(column_count)).to_a
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
    puts row.join
  end
end

# ディレクトリに存在するファイルの取得
files = Dir.glob('*')
# 空白処理
items = adjust_string_length(files)
# 1列の要素数
columns = one_column_items(items)
# 1行の要素数を出力
output_row_items(columns)
