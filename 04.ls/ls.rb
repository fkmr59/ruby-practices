def output_one_column_items(directories, column_count, surplus)
  items_column = []
  cut_items = directories.length / column_count
  if surplus.positive?
    surplus.times do
      array_items = directories.slice!(0..cut_items)
      items_column << array_items
    end
  end
  directories.each_slice(cut_items) do |array_items|
    items_column << array_items
  end
  items_column
end

def one_row_items(insert_column_items)
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

def output_space_process(insert_row_items)
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
directories = Dir.glob('*')
# 列の指定(column_countの数値だけを希望する列数に変える)
column_count = 3
surplus = directories.length % column_count

# 1列の要素数
insert_column_items = output_one_column_items(directories, column_count, surplus)
# 1行の要素数
insert_row_items = one_row_items(insert_column_items)
# 空白処理
output_space_process(insert_row_items)
