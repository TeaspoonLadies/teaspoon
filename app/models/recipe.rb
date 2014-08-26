require 'pry'
require 'fractional'
class Recipe < ActiveRecord::Base

  has_one :shopping_list
  before_save :conversion
def frac(new_num)
	Fractional.new(new_num, :to_nearest => "1/12").to_s( mixed_number: true )
end

def m2tea(num)
	if num[/(\d+)\.?(\d+)?/].to_f < 14.79
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 4.93).round(2)
		# binding.pry
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} teaspoons"
		else  
			new_measurement = "#{frac(new_num)} teaspoon"
		end	
	elsif num[/(\d+)\.?(\d+)?/].to_f < 29.57
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 14.79).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} tablespoons"
		else  
			new_measurement = "#{frac(new_num)} tablespoon"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f < 236.59
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 29.57).round(2)
		new_measurement = "#{new_num} fl oz"
	elsif num[/(\d+)\.?(\d+)?/].to_f < 473.18
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 236.59).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} cups"
		else  
			new_measurement = "#{frac(new_num)} cup"
		end		
	elsif num[/(\d+)\.?(\d+)?/].to_f> 473.18
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 473.18).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} pints"
		else  
			new_measurement = "#{frac(new_num)} pint"
		end
	end	
end


def l2cup(num)
	if num[/(\d+)\.?(\d+)?/].to_f < 0.946
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 0.473).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} pints"
		else  
			new_measurement = "#{frac(new_num)} pint"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f < 3.785
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 0.946).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} quarts"
		else  
			new_measurement = "#{frac(new_num)} quart"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f > 3.785
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 3.785).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} gallons"
		else  
			new_measurement = "#{frac(new_num)} gallon"
		end
	end
end

def g2oz(num)
	if num[/(\d+)\.?(\d+)?/].to_f > 100
		new_num = (num[/(\d+)\.?(\d+)?/].to_f / 454).round(2)
		if new_num > 1.00
			new_measurement = "#{frac(new_num)} pounds"
		else  
			new_measurement = "#{frac(new_num)} pound"
		end
	elsif num[/(\d+)\.?(\d+)?/].to_f <= 100
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
		new_measurement = "#{frac(new_num)} pounds"
	else  
		new_measurement = "#{frac(new_num)} pound"
	end
end

def c2in(num)
	new_num = (num[/(\d+)\.?(\d+)?/].to_f / 2.54).round(2)
	if new_num > 1.00
		new_measurement = "#{frac(new_num)} inches"
	else  
		new_measurement = "#{frac(new_num)} inch"
	end
end

def c2f(num)
	n = num[/(\d+)\.?(\d+)?/].to_f
	new_num = ((n*9)/5 + 32).round(2)
	new_measurement = "#{new_num} °F"
end

def conversion
	unconverted = self.ingredients
	unconverted.gsub!((/\b[Mm]illiliters*\b|ml/), 'milliliter')
	unconverted.gsub!((/\b[Ll]iters*\b|\bl\b/), 'liter')
	unconverted.gsub!((/\b[Gg]grams*\b|\bg\b/), 'gram')
	unconverted.gsub!((/\b[Kk]ilograms*\b|\bkg\b/), 'kilogram')
	unconverted.gsub!((/\b[Cc]entimeters*\b|\bcm\b/), 'centimeter')
  self.ingredients = unconverted.gsub(/(\d+)\.?(\d+)?\s?milliliter/){|num| "#{m2tea(num)}"}.gsub(/(\d+)\.?(\d+)?\s?liter/){|num| "#{l2cup(num)}"}.gsub(/(\d+)\.?(\d+)?\s?gram/){|num| "#{g2oz(num)}"}.gsub(/(\d+)\.?(\d+)?\s?kilogram/){|num| "#{kg2lb(num)}"}.gsub(/(\d+)\.?(\d+)?\s?centimeter/){|num| "#{c2in(num)}"}.gsub(/(\d+)\.?(\d+)?\s?°C/){|num| "#{c2f(num)}"}
end

end
