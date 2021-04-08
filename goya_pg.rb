# pgライブラリを使用する
require 'pg'
# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# 接続したという情報をconnectionという名前の変数に格納する
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する
  result_giveaway = connection.exec("SELECT * FROM crops WHERE give_for != '自家消費'"）
  result.each do |record|  
  result_quality = connection.exec("SELECT * FROM crops WHERE quality = 'f';")
  result.each do |record|
  # 取り出した各行を処理する 
      # 各行を取り出し、putsでターミナル上に出力する
      puts "譲渡したゴーヤ: #{record["SELECT * FROM crops WHERE give_for != '自家消費';"]}" 
      puts "品質の悪いゴーヤ: #{record["SELECT * FROM crops WHERE quality = 'f'"]}"
  end
ensures
  # 最後に.finishでデータベースへのコネクションを切断する
  connection.finish
end