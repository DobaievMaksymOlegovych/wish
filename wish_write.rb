require 'rexml/document'
require 'date'
current_path = File.dirname(__FILE__)
file_name = current_path + "/Wish_chests.xml"
abort "Файл не знайдено" unless File.exist?(file_name)

file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close
puts 'Якa ціль?'
desire_text = gets.chomp
puts 'До коли зробити?(ДД.ММ.РРРР)'
finish_date = gets.chomp
finish_date = Date.parse(finish_date)
start_date = Date.today

desires = doc.elements.find('desires').first
desire = desires.add_element 'desire', {
	'finish_date' => finish_date,
	'start_date' => start_date,
	'text' => desire_text
}

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts 'Бажання збережено)))'
