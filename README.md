# go-tz

tz-lookup by lon and lat

[![GoDoc](https://godoc.org/gopkg.in/ugjka/go-tz.v2?status.svg)](http://godoc.org/gopkg.in/ugjka/go-tz.v2/tz)
[![Go Report Card](https://goreportcard.com/badge/gopkg.in/ugjka/go-tz.v2)](https://goreportcard.com/report/gopkg.in/ugjka/go-tz.v2)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Donate](paypal.svg?raw=true)](https://www.paypal.me/ugjka)

lookup timezone for a given location

## Usage

```go
import "gopkg.in/ugjka/go-tz.v2/tz"
```

### Example

```go
// Loading Zone for Line Islands, Kiritimati
zone, err := tz.GetZone(tz.Point{
    Lon: -157.21328, Lat: 1.74294,
})
if err != nil {
    panic(err)
}
fmt.Println(zone[0])
```

```bash
[ugjka@archee example]$ go run main.go
Pacific/Kiritimati
```

Uses simplified shapefile from [timezone-boundary-builder](https://github.com/evansiroky/timezone-boundary-builder/)

GeoJson Simplification done with [mapshaper](http://mapshaper.org/)

## Features

- The timezone shapefile is embedded in the build binary
- Supports overlapping zones
- You can load your own geojson shapefile if you want
- Sub millisecond lookup even on old hardware

## Problems

- Shapefile is simplified using a lossy method so it may be innacurate along the borders
- This is purely in-memory. Uses ~50MB of ram

## Licenses

The code used to lookup the timezone for a location is licensed under the [MIT License](https://opensource.org/licenses/MIT).

The data in timezone shapefile is licensed under the [Open Data Commons Open Database License (ODbL)](http://opendatacommons.org/licenses/odbl/).
