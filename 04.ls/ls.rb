# frozen_string_literal: true
#!/user/bin/env ruby

def output_one_row_items(dir, hope_num_columns, surplus)
  items_arrays_by_column = []
  cut_items = dir.length / hope_num_columns
    if surplus > 0
      surplus.times do
        array_items = dir.slice!(0..cut_items)
        items_arrays_by_column << array_items
      end
      dir.each_slice(cut_items) do |array_items|
        items_arrays_by_column << array_items
        p items_arrays_by_column
      end
    else
      dir.each_slice(cut_items) do |array_items|
        items_arrays_by_column << array_items
      end
    end

  rebuild_repeat = items_arrays_by_column[0].length

  index= 0
  items_arrays_by_row = []
  rebuild_repeat.times do
    items_arrays_by_column.each do |items_array|
      if items_arrays_by_row[index].nil?
        items_arrays_by_row[index] = []
      end
      items_arrays_by_row[index] << items_array[index]
    end
    index += 1
  end
  
  items_arrays_by_row.each do |array|
    array.compact!
    output = ""
    array.each do |str|
      str_length = str.length + 3
      output += str.to_s.ljust(str_length)
    end
    puts output
  end
end

# ディレクトリに存在するファイルの取得
dir = Dir.glob("*")
# 列の指定(hope_num_columnsの数値だけを希望する列数に変える)
hope_num_columns = 7
surplus = dir.length % hope_num_columns

# 1行に出力する要素の数
output_one_row_items(dir, hope_num_columns, surplus)
