def isVaild?(passport)
	params = {
		"byr"=> false,
		"iyr"=> false,
		"eyr"=> false,
		"hgt"=> false,
		"hcl"=> false,
		"ecl"=> false,
		"pid"=> false
	}
	passport.gsub(":", " ").split(" ").each do |word|
		params[word] = true
	end
	!params.has_value? false	
end

valid_count = 0
File.read('input.txt').split("\n\n").map do |line| 
	valid_count += 1 if isVaild? line.gsub("\n", " ")
end
p valid_count
