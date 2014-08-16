class Recipe < ActiveRecord::Base

  has_one :shopping_list

  def recipe_converter(num, m)
	num = 100
	m = "celsius"

	if m == "milliliters"
		if num > 473.18
			new_num = num / 473.18
			new_measurement = new_num.to_s + "pints"
			puts new_measurement
		elsif num > 236.59
			new_num = num / 236.59
			new_measurement = new_num.to_s + "cups"
			puts new_measurement
		elsif num > 29.57
			new_num = num / 29.57
			new_measurement = new_num.to_s + "fl oz"
			puts new_measurement
		elsif num > 14.79
			new_num = num / 14.79
			new_measurement = new_num.to_s + "tbsp"
			puts new_measurement
		elsif num > 4.93
			new_num = num / 4.93
			new_measurement = new_num.to_s + "tsp"
			puts new_measurement
		end
	end

	if m == "liters"
		if num > 3.785
			new_num = num / 3.785
			new_measurement = new_num.to_s + "gallons"
			puts new_measurement
		elsif num > 0.946
			new_num = num / 0.946
			new_measurement = new_num.to_s + "quarts"
			puts new_measurement
		elsif num > 0.473
			new_num = num / 0.473
			new_measurement = new_num.to_s + "pints"
			puts new_measurement
		end
	end

	if m == "grams"
		new_num = num / 28.35
		new_measurement = new_num.to_s + "ounces"
		puts new_measurement
	end

	if m == "kilograms"
		new_num = num / 0.454
		new_measurement = new_num.to_s + "pounds"
		puts new_measurement
	end

	if m == "centimeters"
		new_num = num / 2.54
		new_measurement = new_num.to_s + "inches"
		puts new_measurement
	end

	if m == "celsius"
		new_num = (num*9)/5 + 32
		new_measurement = new_num.to_s + "fahrenheit"
		puts new_measurement
	end
end

	recipe_converter(100, "celsius")
	
end
