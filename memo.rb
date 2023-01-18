require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

print "1 → 新規でメモを作成する / 2 → 既存のメモを編集する / 3 → 終了する\n" 

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

#1と2の入力による条件分岐
if memo_type == 1
#新規メモの作成
print "新規でメモを作成します。拡張子なしで名前を入力してください\n"
file_name = gets.chomp

print "メモの内容を記入して下さい。Ctrl+Dで保存します\n"
imput_memo = $stdin.read
memo = imput_memo.chomp
CSV.open("#{file_name}.csv","w") do |csv|
csv << ["#{memo}"]

puts memo
end

elsif memo_type == 2
#既存メモの編集
print "保存されているメモを編集します。拡張子なしで名前を入力してください\n" 
file_name = gets.chomp

print "メモの内容を編集して下さい。Ctrl+Dで保存します\n"
edit_memo = STDIN.read
memo = edit_memo.chomp

CSV.open("#{file_name}.csv","a") do |csv|
csv << ["#{memo}"]


end

elsif memo_type == 3
puts "アプリを終了します"

else
print "1,2,3のどれかの数値を入力してください"
end