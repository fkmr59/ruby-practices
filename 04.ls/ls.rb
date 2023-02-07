# frozen_string_literal: true
#!/user/bin/env ruby

# 要素一つ一つにスペースを入れたい
# 出力に入る要素は横方向に一つの配列
# 要素の見た目は縦方向に揃える

def one_row_items(dir, hope_roundup_columns)
  items_arrays_by_column = []
  dir.each_slice(hope_roundup_columns) do |b|
    items_arrays_by_column << b
  end

  items_arrays_by_row = []
  items_arrays_by_column.each do |items_array|
    if items_arrays_by_row[0].nil?
      items_arrays_by_row[0] = []
    end
    items_arrays_by_row[0] << items_array[0]
  end
  items_arrays_by_column.each do |items_array|
    if items_arrays_by_row[1].nil?
      items_arrays_by_row[1] = []
    end
    items_arrays_by_row[1] << items_array[1]
  end
  items_arrays_by_column.each do |items_array|
    if items_arrays_by_row[2].nil?
      items_arrays_by_row[2] = []
    end
    items_arrays_by_row[2] << items_array[2]
  end
  items_arrays_by_column.each do |items_array|
    if items_arrays_by_row[3].nil?
      items_arrays_by_row[3] = []
    end
    items_arrays_by_row[3] << items_array[3]
  end
  items_arrays_by_row.each do |array|
    output = ""
    array.each do |str|
      output += str.to_s.ljust(10)
    end
    puts output
  end
end



# ディレクトリに存在するファイルの取得
dir = Dir.glob("*")
# 列の指定(num_of_columnsの数値だけを希望する列数に変える)
hope_num_columns = 3
floor_num = dir.length / hope_num_columns.to_f
hope_roundup_columns = floor_num.ceil

one_row_items(dir, hope_roundup_columns)

