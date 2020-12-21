PARAMS = {
  "byr"=> lambda { |val| val.to_i >= 1920 and val.to_i <= 2002 },
  "iyr"=> lambda { |val| val.to_i >= 2010 and val.to_i <= 2020 },
  "eyr"=> lambda { |val| val.to_i >= 2020 and val.to_i <= 2030 },
  "hgt"=> lambda { |val| is_valid_hgt? val },
  "hcl"=> lambda { |val| !val.match(/^#[0-9a-f]{6}$/).nil? },
  "ecl"=> lambda { |val| !val.match(/^(amb|blu|brn|gry|grn|hzl|oth)$/).nil?},
  "pid"=> lambda { |val| !val.match(/^\d{9}$/).nil? },
}

def to_map(passport)
  m = {}
  passport.each do |param|
    param_arr = param.split(":")
    m[param_arr[0]] = param_arr[1]
  end
  m
end

def is_valid_hgt?(hgt)
  m = hgt.match(/^(\d+)(cm|in)$/)
  return false if m.nil?
  return (m[1].to_i >= 150 and m[1].to_i <= 193) if m[2] == "cm"
  m[1].to_i >= 59 and m[1].to_i <= 76
end

def is_valid_passport?(pass_map)
  PARAMS.each do |field, is_valid|
    return false unless pass_map.has_key? field
    next if is_valid.call pass_map[field]
    return false
  end
end

valid_count = 0
File.read('input.txt').split("\n\n").map do |line| 
  valid_count += 1 if is_valid_passport? to_map line.gsub("\n", " ").split(" ")
end
p valid_count

