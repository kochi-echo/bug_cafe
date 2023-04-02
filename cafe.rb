# frozen_string_literal: true

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

def input_order_number(menus)
  order_number = nil
  loop do
    print '>'
    order_str = gets
    raise '注文を中止します。またのご利用お待ちしております。' if order_str == "q\n"

    order_number = order_str.to_i - 1
    break if order_number >= 0 && order_number < menus.size

    puts '範囲外です。もう一度番号でご注文ください。(注文を中止する場合はqを押してください。)'
  end
  order_number
end

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end
  order_number = input_order_number(menus)
  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end

begin
  puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ。(注文を中止する場合はqを押してください。)'
  order_drink = take_order(DRINKS)

  puts 'フードメニューはいかがですか?'
  order_food = take_order(FOODS)

  total = DRINKS[order_drink][:price].to_i + FOODS[order_food][:price].to_i
  puts "お会計は#{total}円になります。ありがとうございました！"
rescue StandardError => e
  puts e
end
