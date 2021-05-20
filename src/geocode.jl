using HTTP
using JSON
using DataFrames

function address(street_address::Vector{String})
    street_address = replace.(street_address, r"\s*(,)?\s+" => "+")
    return(street_address)
end

function geocode(street_address::String, api_key::String, method::String)
    street_address = replace.(street_address, r"\s*(,)?\s+" => "+")
    if method == "google"
        url = "https://maps.googleapis.com/maps/api/geocode/json?address=$street_address&key=$api_key"
        response = HTTP.get(url)
        gem = geomgoogle(JSON.parse(String(response.body)))
    elseif method == "osm"
        url = "http://www.mapquestapi.com/geocoding/v1/address?key=$api_key&location=$street_address"
        response = HTTP.get(url)
        gem = geomOSM(JSON.parse(String(response.body)))
    else
        gem = error("Please use method correctly. Currently JuliaMaps.jl only supports two methods: google and osm")
    end
    return(gem)
end

function geometry(geocode_output)
    lat = getindex.(geocode_output, "lat")
    lng = getindex.(geocode_output, "lng")
    d   = DataFrame(Longitude = lng, Latitude = lat)
    return(d)
end