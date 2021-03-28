# pix_fmt.cr

A [Crystal] library for working with different pixel formats, such as RGB, RGBA,
BGR, HSL, HSV, HSVA, YUV, and YUYV.

## Features

* RGB / RGBA
* BGR
* HSV / HSVA
* HSL
* YUV
* YUYV

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pixel:
       github: postmodern/pix_fmt
   ```

2. Run `shards install`

## Usage

```crystal
require "pix_fmt/rgb"

pix = PixFmt::RGB.new(0,255,0)
yuyv_pix = pix.to_yuyv
```

## TODO

* Add arithmetic operation functions.
* Add a YUYV -> RGB conversion function.
* Add a RGB -> YUYV conversion function.
* Add a HSL -> RGB conversion function.
* Add a HSV -> RGB conversion function.

## Contributing

1. Fork it (<https://github.com/postmodern/pix_fmt/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Postmodern](https://github.com/postmodern) - creator and maintainer

[Crystal]: https://crystal-lang.org/
