# gopkg.in/photoprism/go-tz.v2

[![GoDoc](https://godoc.org/gopkg.in/photoprism/go-tz.v2?status.svg)](http://godoc.org/gopkg.in/photoprism/go-tz.v2/tz)
[![Go Report Card](https://goreportcard.com/badge/gopkg.in/photoprism/go-tz.v2)](https://goreportcard.com/report/gopkg.in/photoprism/go-tz.v2)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](CODE_LICENSE)

Go library for offline timezone lookup by latitude and longitude. This is a fork of [`ugjka/go-tz`](https://github.com/ugjka/go-tz) that includes the latest [timezone boundaries data](https://github.com/photoprism/go-tz/blob/master/tz/gen.go) and a [Makefile](Makefile) for build automation.

`go-tz` uses a simplified shapefile from [timezone-boundary-builder](https://github.com/evansiroky/timezone-boundary-builder/) for the lookups. The GeoJSON simplification was done with [mapshaper](http://mapshaper.org/).

## Usage Example

```go
import "gopkg.in/photoprism/go-tz.v2/tz"

func TimeZone(lat, lng float64) (result string) {
    result = "UTC"

    zones, err := tz.GetZone(tz.Point{Lat: lat, Lon: lng})

    if err == nil && len(zones) > 0 {
        result = zones[0]
    }

    return result
}
```

## Key Features

- Timezone shapefile is embedded in the build binary
- Supports overlapping zones
- You can load your own geojson shapefile if you want
- Sub millisecond lookup even on old hardware

## Known Issues

- Shapefile is simplified using a lossy method so it may be innacurate along the borders
- This is purely in-memory. Uses ~50MB of ram

## License

The code used to lookup the timezone for a location is licensed under the [MIT License](CODE_LICENSE).

The data in timezone shapefile is licensed under the [Open Data Commons Open Database License (ODbL)](http://opendatacommons.org/licenses/odbl/).
