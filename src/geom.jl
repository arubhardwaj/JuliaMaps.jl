
function longitude(geocode_output)
    lng = getindex.(geocode_output, "lng")
    return(lng)
end


function latitude(geocode_output)
    lat = getindex.(geocode_output, "lat")
    return(lat)
end