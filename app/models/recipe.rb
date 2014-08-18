require 'pry'
class Recipe < ActiveRecord::Base
	attr_accessor :data
  has_one :shopping_list

def m2tea(num)
	if num[/(\d+)\.?(\d+)?/].to_f> 473.18
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 473.18).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} pints"
		else  
			new_measurement = "#{new_num} pint"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 236.59
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 236.59).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} cups"
		else  
			new_measurement = "#{new_num} cup"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 29.57
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 29.57).round(2)
		new_measurement = "#{new_num} fl oz"
	elsif num[/(\d+)\.?(\d+)?/].to_f > 14.79
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 14.79).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} tablespoons"
		else  
			new_measurement = "#{new_num} tablespoon"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 4.93
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 4.93).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} teaspoons"
		else  
			new_measurement = "#{new_num} teaspoon"
		end
	end	
end


def l2cup(num)
  if num[/(\d+)\.?(\d+)?/].to_f > 3.785
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 3.785).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} gallons"
		else  
			new_measurement = "#{new_num} gallon"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 0.946
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 0.946).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} quarts"
		else  
			new_measurement = "#{new_num} quart"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 0.473
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 0.473).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} pints"
		else  
			new_measurement = "#{new_num} pint"
		end
	end
end

def g2oz(num)
	if num[/(\d+)\.?(\d+)?/].to_f > 100
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 454).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} pounds"
		else  
			new_measurement = "#{new_num} pound"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 28.35
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 28.35).round(2)
		if new_num > 1.00
			new_measurement = "#{new_num} ounces"
		else  
			new_measurement = "#{new_num} ounce"
		end
	end	
end	

def kg2lb(num)
	new_num = (num[/(\d+)\.?(\d+)?/].to_f / 0.454).round(2)
	if new_num > 1.00
			new_measurement = "#{new_num} pounds"
		else  
			new_measurement = "#{new_num} pound"
		end
end

def c2in(num)
	new_num = (num[/(\d+)\.?(\d+)?/].to_f / 2.54).round(2)
	if new_num > 1.00
			new_measurement = "#{new_num} inches"
		else  
			new_measurement = "#{new_num} inch"
		end
end

def c2f(num)
	n = num[/(\d+)\.?(\d+)?/].to_f
	new_num = ((n*9)/5 + 32).round(2)
	new_measurement = "#{new_num} °F"
end


def conversion(data)
	data.gsub!('milliliters', 'milliliter')
	data.gsub!('liters', 'liter')
	data.gsub!('grams', 'gram')
	data.gsub!('kilograms', 'kilogram')
	data.gsub!('centimeters', 'centimeter')
  data.gsub(/(\d+)\.?(\d+)?\s?milliliter/){|num| "#{m2tea(num)}"}.gsub(/(\d+)\.?(\d+)?\s?liter/){|num| "#{l2cup(num)}"}.gsub(/(\d+)\.?(\d+)?\s?gram/){|num| "#{g2oz(num)}"}.gsub(/(\d+)\.?(\d+)?\s?kilogram/){|num| "#{kg2lb(num)}"}.gsub(/(\d+)\.?(\d+)?\s?centimeter/){|num| "#{c2in(num)}"}.gsub(/(\d+)\.?(\d+)?\s?°C/){|num| "#{c2f(num)}"}
end

# .gsub(/\d+\s?°C/){|num| "#{c2f(num)}"}
# print conversion("Today it is 25°C and tomorrow 27 °C. Today it is 6 milliliters and tomorrow 10 milliliters. Today it is 2 liter and tomorrow 3 liter.")
# print conversion("Today it is 500 milliliters and 300 milliliter and 40 milliliter, 16 milliliter and 5 milliliter. It is 5 liter and 1 liter and 0.5 liter. It is 500 grams. It is 30 kilogram. It is 400 centimeter. Tomorrow is 25°C.")
end
