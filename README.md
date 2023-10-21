# gopkg.in/photoprism/go-tz.v2

[![GoDoc](https://godoc.org/gopkg.in/photoprism/go-tz.v2?status.svg)](http://godoc.org/gopkg.in/photoprism/go-tz.v2/tz)
[![Go Report Card](https://goreportcard.com/badge/gopkg.in/photoprism/go-tz.v2)](https://goreportcard.com/report/gopkg.in/photoprism/go-tz.v2)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](CODE_LICENSE)

Go library for fast offline timezone lookup by latitude and longitude. This is a fork of [`ugjka/go-tz`](https://github.com/ugjka/go-tz) that includes the latest [timezone boundaries data](https://github.com/photoprism/go-tz/blob/master/tz/gen.go) and a [Makefile](Makefile) for build automation.

Uses a simplified shapefile from [timezone-boundary-builder](https://github.com/evansiroky/timezone-boundary-builder/) for the lookups. The GeoJSON simplification was done with [mapshaper](http://mapshaper.org/).

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

- Fast sub-millisecond lookups, even on old hardware
- Timezone shapefile for lookups is embedded in the build binary
- Supports overlapping timezones
- You can load your own geojson shapefile if you want

## Known Issues

- The shapefile is simplified using a lossy method, so it may be inaccurate along the boundaries
- Since the library runs completely in memory, it requires about 50 MB of RAM

## Licensing

The embedded timezone data is licensed under the [Open Data Commons Open Database License (ODbL)](http://opendatacommons.org/licenses/odbl/). Any other code in this library can be used under the terms of the [MIT License](CODE_LICENSE).
