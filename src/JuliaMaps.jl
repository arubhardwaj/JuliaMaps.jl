
module JuliaMaps
    include("geocode.jl")
    include("geom.jl")
    export geocode
    export geometry
    export address
    export geomgoogle
    export geomOSM
    export longitude
    export latitude
end