# frozen_string_literal: true

def space_add(file__name_array)
  ary = []
  max_length = file__name_array.max.ljust(file__name_array.max.length + 1)
  file__name_array.each do |item|
    ary << item.ljust(max_length.length) if item.length < max_length.length
  end
  ary
end

def one_column_items(blank_process)
  column_count = 3
  one_column_items = blank_process.each_slice(blank_process.length.div(column_count) + 1).to_a
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
    p row
  end
end


# ディレクトリに存在するファイルの取得
file__name_array = Dir.glob('*')
# 空白処理
blank_process = space_add(file__name_array)
# 1列の要素数
columns = one_column_items(blank_process)
# 1行の要素数を出力
output_row_items(columns)
