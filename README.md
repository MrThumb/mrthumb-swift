# MrThumb

[![CI Status](http://img.shields.io/travis/Martin Fernandez/mrthumb.svg?style=flat)](https://travis-ci.org/Martin Fernandez/mrthumb)
[![Version](https://img.shields.io/cocoapods/v/mrthumb.svg?style=flat)](http://cocoapods.org/pods/mrthumb)
[![License](https://img.shields.io/cocoapods/l/mrthumb.svg?style=flat)](http://cocoapods.org/pods/mrthumb)
[![Platform](https://img.shields.io/cocoapods/p/mrthumb.svg?style=flat)](http://cocoapods.org/pods/mrthumb)

## Installation

MrThumb is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MrThumb"
```

## Usage

Simple transformation:

**Swift**
```swift
let configuration = Configuration(
    accessId: "XXX",
    secretId: "ZZZ"
)

let client = Client(withConfiguration: configuration)

client.createImage(
    url: "http://sample.com/image.jpg",
    transformations: [
        "resize": [
            "height": 200
        ]
    ]) { (success, data) -> () in
    if success {
        // Do something with the image
    } else {
        // Handle error
    }
}
```

## Author

Martin Fernandez, fmartin91@gmail.com

## License

MrThumb is available under the MIT license. See the LICENSE file for more info.
