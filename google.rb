require "json"
require "open-uri"
require "launchy"

def return_bar_coordinates
input = lat = long = i = 0

  while input != "stop"
    puts "Type an address or stop"
    input = gets.chomp
    if input != "stop"
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{input}&sensor=false"
      file = open(url).read
      address = JSON.parse(file)
      results_array = address["results"]
      lat += results_array[0]["geometry"]["location"]["lat"]
      long += results_array[0]["geometry"]["location"]["lng"]
      i += 1
    end
  end
lat = lat.fdiv(i)
long = long.fdiv(i)
Launchy.open( "http://www.latlong.net/c/?lat=#{lat}&long=#{long}" )
end

return_bar_coordinates
