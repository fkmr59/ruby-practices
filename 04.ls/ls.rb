# !/user/bin/env ruby
# frozen_string_literal: true

def output_one_column_items(dir, hope_num_columns, surplus)
  items_arrays_by_column = []
  cut_items = dir.length / hope_num_columns
  if surplus.positive?
    surplus.times do
      array_items = dir.slice!(0..cut_items)
      items_arrays_by_column << array_items
    end
  end
  dir.each_slice(cut_items) do |array_items|
    items_arrays_by_column << array_items
  end
  items_arrays_by_column
end

def output_one_row_items(insert_column_items)
  rebuild_repeat = insert_column_items[0].length
  index = 0
  items_arrays_by_row = []
  rebuild_repeat.times do
    insert_column_items.each do |items_array|
      items_arrays_by_row[index] = [] if items_arrays_by_row[index].nil?
      items_arrays_by_row[index] << items_array[index]
    end
    index += 1
  end
  items_arrays_by_row
end

def space_process(insert_row_items)
  insert_row_items.each do |array|
    array.compact!
    output = ''
    array.each do |str|
      str_length = str.length + 3
      output += str.to_s.ljust(str_length)
    end
    puts output
  end
end

# ディレクトリに存在するファイルの取得
dir = Dir.glob('*')
# 列の指定(hope_num_columnsの数値だけを希望する列数に変える)
hope_num_columns = 3
surplus = dir.length % hope_num_columns

# 1列の要素数
insert_column_items = output_one_column_items(dir, hope_num_columns, surplus)
# 1行の要素数
insert_row_items = output_one_row_items(insert_column_items)
# 空白処理
space_process(insert_row_items)
