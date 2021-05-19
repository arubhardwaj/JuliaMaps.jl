# JuliaMaps

[![Build Status](https://travis-ci.com/arubhardwaj/JuliaMaps.jl.svg?branch=master)](https://travis-ci.com/arubhardwaj/JuliaMaps.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/arubhardwaj/JuliaMaps.jl?svg=true)](https://ci.appveyor.com/project/arubhardwaj/JuliaMaps-jl)
[![Coverage](https://codecov.io/gh/arubhardwaj/JuliaMaps.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/arubhardwaj/JuliaMaps.jl)
[![Coverage](https://coveralls.io/repos/github/arubhardwaj/JuliaMaps.jl/badge.svg?branch=master)](https://coveralls.io/github/arubhardwaj/JuliaMaps.jl?branch=master)


** This package is under heavy construction **

Julia Maps is a package which can be used for geocoding in and plotting data on maps. The idea is to create something like [ggmap](https://github.com/dkahle/ggmap) for plotting maps in Julia. 

Currently, it can only be used as a geocoding client for Google Maps API. It is needed to have an API key for using this package, which can be requested from [Google Cloud Console](https://console.cloud.google.com/). For more information on requesting a Google Maps API visit [Google Maps Documentation](https://developers.google.com/maps/gmp-get-started).


# Installation

` pkg> add https://github.com/arubhardwaj/JuliaMaps.jl `

# Usage

```julia
using JuliaMaps 
geocode("Address", "Api Key")
````

For example:

```julia
geocode("1600 Amphitheatre Parkway, Mountain View, CA", "API Key")
```

For a vector, it'd be required to use [broadcasting](https://julia.guide/broadcasting) feature. For example:


```julia
geocode.(addresses, "API Key")
```

`geocode()` will call the data from Google Maps API. For printing coordinates of longitudes and latitudes, execute `geometry(geocode_output)`. Example:

```julia
geocode_output = geocode("1600 Amphitheatre Parkway, Mountain View, CA", "API Key")

geometry(geocode_output)
```

It is also possible to print only longitudes and only latitudes using `longitude(geocode_output)` and `latitude(geocode_output)`
