# frozen_string_literal: true

def one_column_items(file__name_array)
  column_count = 3
  one_column_items = file__name_array.each_slice(file__name_array.length.div(column_count) + 1).to_a
  if one_column_items.last.length == column_count
    one_column_items.transpose
  else
    (one_column_items.first.length - one_column_items.last.length).times do
      one_column_items.last.push(nil)
    end
  one_column_items  
  end
end

def output_row_space_process(columns)
  columns.transpose.each do |row|
    row.compact!
    output = ''
    row.each do |item_space|
      output += item_space.ljust(item_space.length + 3)
    end
    puts output
  end
end

# ディレクトリに存在するファイルの取得
file__name_array = Dir.glob('*')
# 1列の要素数
columns = one_column_items(file__name_array)
# 空白処理
output_row_space_process(columns)
