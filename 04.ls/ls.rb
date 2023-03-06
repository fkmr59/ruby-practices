# frozen_string_literal: true

def one_column_items(directories)
  # 列の指定(column_countの数値だけを希望する列数に変える)
  column_count = 3
  items = []
  surplus = directories.length % column_count
  
  cut_items = directories.length / column_count
  surplus.times do
    items << directories.slice!(0..cut_items)
  end
  directories.each_slice(cut_items) do |array_items|
    items << array_items
  end
  items
end

def one_row_items(items)
  rebuild_repeat = items[0].length
  index = 0
  items_arrays_by_row = []
  rebuild_repeat.times do
    items.each do |items_array|
      items_arrays_by_row[index] = [] if items_arrays_by_row[index].nil?
      items_arrays_by_row[index] << items_array[index]
    end
    index += 1
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
directories = Dir.glob('*')

# 1列の要素数
items = one_column_items(directories)
# 1行の要素数
items = one_row_items(items)
# 空白処理
output_space_process(items)
