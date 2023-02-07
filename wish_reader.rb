require 'rexml/document'
require 'date'
current_path = File.dirname(__FILE__)
file_name = current_path + "/Wish_chests.xml"
abort "Файл не знайдено" unless File.exist?(file_name)

file = File.new(file_name)
doc = REXML::Document.new(file)
file.close
finish_desire = ""
not_fiinsh_desire = ""
today_desire =""
doc.elements.each("desires/desire") do |item|
	finish_date = Date.parse(item.attributes["finish_date"])
	text = item.attributes["text"]
	if finish_date < Date.today
		finish_desire += "Дата кінця: #{finish_date} Задача: #{text} \n"
	elsif finish_date > Date.today
		not_fiinsh_desire += "Дата кінця: #{finish_date} Задача: #{text} \n"
	elsif finish_date == Date.today
		today_desire += "Дата кінця: #{finish_date} Задача: #{text} \n "
	end
end 
system "cls"
puts "Задачі, які вже закінчились:
#{finish_desire} \n"
puts "Задачі, які не закінчились:
#{not_fiinsh_desire} \n"
puts "Задачі, які закінчуються сьогодні:
#{today_desire} \n"
