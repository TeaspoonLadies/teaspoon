require 'pry'
class Recipe < ActiveRecord::Base

  has_one :shopping_list

#   def recipe_converter(num, m)
# 	num = 100
# 	m = "celsius"

# 	if m == "milliliters"
# 		if num > 473.18
# 			new_num = num / 473.18
# 			new_measurement = new_num.to_s + "pints"
# 			puts new_measurement
# 		elsif num > 236.59
# 			new_num = num / 236.59
# 			new_measurement = new_num.to_s + "cups"
# 			puts new_measurement
# 		elsif num > 29.57
# 			new_num = num / 29.57
# 			new_measurement = new_num.to_s + "fl oz"
# 			puts new_measurement
# 		elsif num > 14.79
# 			new_num = num / 14.79
# 			new_measurement = new_num.to_s + "tbsp"
# 			puts new_measurement
# 		elsif num > 4.93
# 			new_num = num / 4.93
# 			new_measurement = new_num.to_s + "tsp"
# 			puts new_measurement
# 		end
# 	end

# 	if m == "liters"
# 		if num > 3.785
# 			new_num = num / 3.785
# 			new_measurement = new_num.to_s + "gallons"
# 			puts new_measurement
# 		elsif num > 0.946
# 			new_num = num / 0.946
# 			new_measurement = new_num.to_s + "quarts"
# 			puts new_measurement
# 		elsif num > 0.473
# 			new_num = num / 0.473
# 			new_measurement = new_num.to_s + "pints"
# 			puts new_measurement
# 		end
# 	end

# 	if m == "grams"
# 		new_num = num / 28.35
# 		new_measurement = new_num.to_s + "ounces"
# 		puts new_measurement
# 	end

# 	if m == "kilograms"
# 		new_num = num / 0.454
# 		new_measurement = new_num.to_s + "pounds"
# 		puts new_measurement
# 	end

# 	if m == "centimeters"
# 		new_num = num / 2.54
# 		new_measurement = new_num.to_s + "inches"
# 		puts new_measurement
# 	end

# 	if m == "celsius"
# 		new_num = (num*9)/5 + 32
# 		new_measurement = new_num.to_s + "fahrenheit"
# 		puts new_measurement
# 	end
# end

# 	recipe_converter(100, "celsius")


def self.c2f(num)
    (num*9.0/5+32).to_f.round(2)
end

 # def self.m2tea(c)
 #  if c < 14.79
 #    (c/4.93).to_f.round(2)
 #  elsif c < 29.57
 #    (c/14.79).to_f.round(2) 
 #  end 
 # end  


def self.m2tea(num)
	if num[/\d+/].to_f> 473.18
		new_num = (num[/\d+/].to_f / 473.18).round(2)
		new_measurement = "#{new_num} pints"
	elsif num[/\d+/].to_f > 236.59
		new_num = (num[/\d+/].to_f / 236.59).round(2)
		new_measurement = "#{new_num} cups"
	elsif num[/\d+/].to_f > 29.57
		new_num = (num[/\d+/].to_f / 29.57).round(2)
		new_measurement = "#{new_num} fl oz"
	elsif num[/\d+/].to_f > 14.79
		new_num = (num[/\d+/].to_f / 14.79).round(2)
		new_measurement = "#{new_num} tbsp"
	elsif num[/\d+/].to_f > 4.93
		new_num = (num[/\d+/].to_f / 4.93).round(2)
		new_measurement = "#{new_num} tsp"
	end	
end


def self.l2cup(num)
   if num[/\d+/].to_f > 3.785
		new_num = (num[/\d+/].to_f / 3.785).round(2)
		new_measurement = "#{new_num} gallons"
	elsif num[/\d+/].to_f > 0.946
		new_num = (num[/\d+/] / 0.946).round(2)
		new_measurement = "#{new_num} quarts"
	elsif num[/\d+/].to_f > 0.473
		new_num = (num[/\d+/] / 0.473).round(2)
		new_measurement = "#{new_num} pints"
	end
end

def self.g2oz(num)
	new_num = (num[/\d+/].to_f / 28.35).round(2)
	new_measurement = "#{new_num} ounces"
end	

def self.kg2lb(num)
		new_num = (num[/\d+/].to_f / 0.454).round(2)
		new_measurement = "#{new_num} pounds"
end

def self.c2in(num)
		new_num = (num[/\d+/].to_f / 2.54).round(2)
		new_measurement = "#{new_num} inches"
end

def self.c2f(num)
	new_num = ((num[/\d+/].to_f *9)/5 + 32).round(2)
	new_measurement = "#{new_num} fahrenheit"
end
end


def self.conversion(string)
  # matchers = { '/\d+\s?milliliter/' => "#{m2tea(s[/\d+/].to_i)} teaspoon"}
  # string = 'Today it is 6 milliliter and tomorrow is 25°C.'
# binding.pry
  # string.gsub(/\d+\s?milliliter/){|s| "#{m2tea(s[/\d+/].to_f)} teaspoon"}.gsub(/\d+\s?°C/){|s| "#{c2f(s[/\d+/].to_i)}°F"}.gsub(/\d+\s?liter/){|s| "#{l2cup(s[/\d+/].to_f)} cups"}
  string.gsub(/\d+\s?milliliter/){|num| "#{m2tea(num)}"}
  .gsub(/\d+\s?°C/){|num| "#{c2f(num)}"}
  .gsub(/\d+\s?liter/){|num| "#{l2cup(num)}"}
  .gsub(/\d+\s?gram/){|num| "#{g2oz(num)}"}
  .gsub(/\d+\s?kilogram/){|num| "#{kg2lb(num)}"}
  .gsub(/\d+\s?centimeter/){|num| "#{c2in(num)}"}
  # 	string.gsub(/\d+\s?milliliter/){|num|
  # 			m2tea(num) 
  # 	# 	if num[/\d+/].to_f> 473.18
  # 	# 		new_num = (num[/\d+/].to_f / 473.18).round(2)
  # 	# 		# new_measurement = new_num.to_s + "pints"
  # 	# 		new_measurement = "#{new_num} pints"
		# 	# 	# puts new_measurement
		# 	# end	
		# }	
end

# print conversion("Today it is 25°C and tomorrow 27 °C. Today it is 6 milliliters and tomorrow 10 milliliters. Today it is 2 liter and tomorrow 3 liter.")
print conversion("Today it is 16 milliliter and 300 milliliter and 40 milliliter, 16 milliliter and 5 milliliter and tomorrow is 25°C.")
	
end
