using HTTP
using JSON

function address(street_address::Vector{String})
    street_address = replace.(street_address, r"\s*(,)?\s+" => "+")
    return(street_address)
end

function geometry(json_response)
    lat = getindex.(json_response, "lat")
    lng = getindex.(json_response, "lng")
    return(DataFrame(lat, lng))
end

function geom(json_response::Dict{String, Any})
    gem = json_response["results"][1]["geometry"]["location"]
    return((gem))
end

function geocode(street_address::String, api_key::String)
    street_address = replace.(street_address, r"\s*(,)?\s+" => "+")
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=$street_address&key=$api_key"
    response = HTTP.get(url)
    gem = geom(JSON.parse(String(response.body)))
    return(gem)
end

function geometry(geocode_output)
    lat = getindex.(geocode_output, "lat")
    lng = getindex.(geocode_output, "lng")
    d = DataFrame(Longitude = lng, Latitude = lat)
    return(d)
end
