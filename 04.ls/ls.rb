# frozen_string_literal: true

def one_column_items(file_count)
  # 列の指定(column_countの数値だけを希望する列数に変える)
  column_count = 3
  items = []
  one_column_quantity = file_count.length.div(column_count)
  file_count.length.modulo(column_count).times do
    items << file_count.slice!(0..one_column_quantity)
  end
  file_count.each_slice(one_column_quantity) do |file_count_over|
    items << file_count_over
  end
  items
end

def one_row_items(items)
  rebuild_repeat = items[0].length
  items_arrays_by_row = []
  rebuild_repeat.times do |index|
    items.each do |items_array|
      items_arrays_by_row[index] = [] if items_arrays_by_row[index].nil?
      items_arrays_by_row[index] << items_array[index]
    end
  end
  items_arrays_by_row
end

def output_space_process(items)
  items.each do |array|
    array.compact!
    output = ''
    array.each do |str|
      str_length = str.length + 3
      output += str.ljust(str_length)
    end
    puts output
  end
end

# ディレクトリに存在するファイルの取得
file_count = Dir.glob('*')

# 1列の要素数
items = one_column_items(file_count)
# 1行の要素数
items = one_row_items(items)
# 空白処理
output_space_process(items)
