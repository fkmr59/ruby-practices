# frozen_string_literal: true

def one_column_items(file__name_array)
  # 列の指定(column_countの数値だけを希望する列数に変える)
  column_count = 3
  file__name_array.each_slice(file__name_array.length.div(column_count) + 1).to_a
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
