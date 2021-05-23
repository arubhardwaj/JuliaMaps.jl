using HTTP
using JSON
using DataFrames

"""
For obtaining the address in the format to use with the API key `address()` can be used.

Example:

julia> address("1600 Amphitheatre Parkway, Mountain View, CA")

"""

function address(street_address::Vector{String})
    street_address = replace.(street_address, r"\s*(,)?\s+" => "+")
    return(street_address)
end

"""
        `julia> geocode(street_address::String, api_key::String, method::String)`

JuliaMaps has `geocode()` for obtaining the coordingates of locations. It will produce `longitude` and `latitude` of location in `Dict`.

    Usage: 
    `julia> geocode("full address", "api key", "method")`

    Note: Currently, `geocode()` can call from two methods: "google" and "osm".

If there are more than one addresses, it'd be reueired to use broadcasting operator with `geocode()`.

    Example: 
    `julia> geocode.(address_list, "api","method")`

Method:
- google: Calls data from google maps. In this case, it'd be reqired to use google maps api key.
- osm: Calls data from open street maps, using MapQuest api. Visit: https://developer.mapquest.com/documentation/
"""

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

"""
If there were more than one addresses in geocoding, while using `geocode()`, all the longitudes and latitudes can be printed in a data frame using `geometry(geocod_output)`.

    Usage: 
    `julia> geometry(geocode_output)`

Note: This function can only be used if there were more than one addresses in `geocode()`.
"""

function geometry(geocode_output)
    lat = getindex.(geocode_output, "lat")
    lng = getindex.(geocode_output, "lng")
    d   = DataFrame(Longitude = lng, Latitude = lat)
    return(d)
end