
function longitude(geocode_output)
    lng = getindex.(geocode_output, "lng")
    return(lng)
end


function latitude(geocode_output)
    lat = getindex.(json_response, "lat")
    return(lat)
end