# frozen_string_literal: true
#!/user/bin/env ruby

def output_one_row_items(dir, hope_roundup_columns)
  items_arrays_by_column = []
  dir.each_slice(hope_roundup_columns) do |cut_items|
    items_arrays_by_column << cut_items
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
      p items_arrays_by_row
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
# 列の指定(num_of_columnsの数値だけを希望する列数に変える)
hope_num_columns = 6
Floor_num = dir.length / hope_num_columns.to_f
hope_roundup_columns = Floor_num.ceil.freeze
# 1行に出力する要素の数
output_one_row_items(dir, hope_roundup_columns)
