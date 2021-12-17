require 'stringio'

data = DATA.read.strip

def parse_literal(input)
  data = ""

  while group = input.read(5)
    data << group[1..-1]
    break if group[0] == "0"
  end

  data.to_i(2)
end

def parse_operator(input)
  subpackets = []

  case input.read(1)
  when "0"
    length_of_subpackets = input.read(15).to_i(2)
    subpackets_input = StringIO.new(input.read(length_of_subpackets))
    until subpackets_input.eof?
      subpackets << parse_packet(subpackets_input)
    end
  when "1"
    number_of_subpackets = input.read(11).to_i(2)
    number_of_subpackets.times do
      subpackets << parse_packet(input)
    end
  else
    raise "unknown input"
  end

  subpackets
end

def parse_packet(input)
  result = {}
  result[:version] = input.read(3).to_i(2)
  result[:type] = input.read(3).to_i(2)
  case result[:type]
  when 4
    result[:value] = parse_literal(input)
  else
    result[:value] = parse_operator(input)
  end

  result
end

def parse(input)
  data = input.each_char.map { sprintf("%04b", _1.to_i(16)) }.join("")
  parse_packet(StringIO.new(data))
end

# Part 1

def sum_versions(parsed)
  sum = 0
  sum += parsed[:version]
  if parsed[:value].is_a?(Array)
    parsed[:value].each do |value|
      sum += sum_versions(value)
    end
  end
  sum
end

puts "Sum of versions: #{sum_versions(parse(data))}"

# Part 2

def resolve(parsed)
  type, value = parsed[:type], parsed[:value]
  case type
  when 0
    value.map { resolve(_1) }.inject(0) { |memo, value| memo + value }
  when 1
    value.map { resolve(_1) }.inject(1) { |memo, value| memo * value }
  when 2
    value.map { resolve(_1) }.min
  when 3
    value.map { resolve(_1) }.max
  when 4
    value
  when 5
    resolve(value.first) > resolve(value.last) ? 1 : 0
  when 6
    resolve(value.first) < resolve(value.last) ? 1 : 0
  when 7
    resolve(value.first) == resolve(value.last) ? 1 : 0
  end
end

puts "Resolved value: #{resolve(parse(data))}"

__END__
020D64AEE52E55B4C017938FBBAC2D6002A53D21F9E90C18023600B80021D0862DC1700043232C2284D3B0105007251DE33CF281802D0E7001A0958C3B6EB542D2014340010B89112E228803518E2047E0004322B4128352DFE72BFE1CC77000E226B92FF7F7F0F4899CCEB788FBA632A444019349E40A801CA941898B661ECBC40820061A78E254024C126797B31A804B27C0582B2D7D4AF02791E431531100B2458A6219D29CB6C4247F7D6DB27BCBA4065138014C05B00801CC0513280108047020106460079801000332200B60002832801C200718012801503801A800B02801723F9B90009D6600D44A87B0CC8010B89D0661F980331F20A44470076767F8EF75AA94F5E1E6E9790C9008BF801AB8002171CA2A45C100661FC508B911C8043EC00C224BB8A753A6677FDB7B8EA85932F4600BE0039138612F684AB86392889C4A201253C013100623D464834200CC1787D09E76FC78200A16603A543E6D9E695E4C74C012D004646D08CAF74391B4232BDD1E4FFEE033805B3DAB074ACF351399FCCEA5F592697E1CB802B2D1D0BCFE410C015B004E46BE17973C949C213153005A6932C0129BDF675DD2CBF3482401BE7802D37AA4DFE6F549BD4A42363A200D5F40149985FEDF2ACF35AB4BD3003004A730F74019B8803F08A0943B1007A21C2487C0002DC578BC600A497B35A8050020F24432444401415002AF07A7F7FE004DB93001A931FC33A802B37FB517A4A52254010E2374C637895BF7E5CC66F53EB0CC2F4C92080292B1E7A0DB26BE6008CE1ACC801804938F530A1227F2A6A4004349A31009F7801A900021908A18C5D100722C43C8F9312CFD4040269934949661E0096FE75092ACA4F0B6A005CD6CBE1218027258AA3F00439377F5D566E338D121C0239DD9C4942FA4E8F73DFA62656402704E523896FAE9E00B4E779DE6BF15595C56DBF0ACD391802F400FA4FEADD769FD5BAE7318FCF32AB8
