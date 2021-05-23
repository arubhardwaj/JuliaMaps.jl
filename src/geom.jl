
function geomgoogle(json_response::Dict{String, Any})
    gem = json_response["results"][1]["geometry"]["location"]
    return((gem))
end

function geomOSM(json_response::Dict{String, Any})
    gem = json_response["results"][1]["locations"][1]["latLng"]
    return((gem))
end



"""
Print all the longitudes from geocode output.

    Usage:
    `julia> longitude(geocode_output)`

Note: This function can only be used if there were more than one addresses in `geocode()`.
"""

function longitude(geocode_output)
    lng = getindex.(geocode_output, "lng")
    return(lng)
end


"""
Print all the latitudes from geocode output.

    Usage:
    `julia> latitude(geocode_output)`

Note: This function can only be used if there were more than one addresses in `geocode()`.
"""

function latitude(geocode_output)
    lat = getindex.(geocode_output, "lat")
    return(lat)
end