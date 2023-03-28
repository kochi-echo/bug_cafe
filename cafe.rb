# frozen_string_literal: true
require 'debug'

=begin
修正内容：
- 頼んだつもりのメニューが選択できない。
  -> 一つ目の注文で1個後のが選択される
  -> １ベースになっているか？
- 最後の番号のメニューを選択するとエラーとなる。
  ->最後の注文のarrayがnil
  ->上記の原因と同じだと思われる。
- お会計額が異様に高い。
  ->金額が合計ではない
- 違う番号のドリンク、フードを注文したとき、お会計が正しくない
方針：
- メニューの選択のところを確認し、0ベースにする
- 金額を+に変更
=end


DRINKS = [
  { name: 'コーヒー', price: '300' },
  { name: 'カフェラテ', price: '400' },
  { name: 'チャイ', price: '460' },
  { name: 'エスプレッソ', price: '340' },
  { name: '緑茶', price: '450' }
].freeze

FOODS = [
  { name: 'チーズケーキ', price: '470' },
  { name: 'アップルパイ', price: '520' },
  { name: 'ホットサンド', price: '410' }
].freeze

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end
  order_number = -1
  while order_number < 0 || order_number >= menus.size
    print '>'
    order_number = gets.to_i - 1
  end
  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end

puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
order1 = take_order(DRINKS)

puts 'フードメニューはいかがですか?'
order2 = take_order(FOODS)

total = DRINKS[order1][:price].to_i + FOODS[order2][:price].to_i
puts "お会計は#{total}円になります。ありがとうございました！"
