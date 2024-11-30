# DateCalc

<img width="788" alt="image" src="https://github.com/user-attachments/assets/ea4eef62-def0-4ed0-ab83-0f310a8a2ef5">

## Example

<p align="center">
  <img src="./Gifs/default.gif" width="150" />
  <img src="./Gifs/make-it-rain.gif" width="150"/>
  <img src="./Gifs/explosion.gif" width="150" />
  <img src="./Gifs/color.gif" width="150" />
</p>

## Overview

This is an open-source library to use with SwiftUI. It allows you to create and ...

- Built with pure SwiftUI.
- Select ...

## Support 

If you like the project, don't forget to `put star 🌟`.

## Navigation

...
- [💻 Installation](#-installation)
  - [Swift Package Manager](#swift-package-manager)
  - [Manually](#manually)
- [🧳 Requirements](#-requirements)
- [🛠 Usage](#-usage)
  - [Parameters](#parameters)
  - [Configurator Application With Live Preview](#configurator-application-with-live-preview)
  - [Examples](#examples)
- [👨‍💻 Contributors](#-contributors)
- [✍️ Author](#-author)
- [📃 License](#-license)
- [📦 Projects](#-projects)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `DateCalc` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/SergeiKriukov/DateCalc.git, :branch="master"
```

---

### Manually

If you prefer not to use any of dependency managers, you can integrate `DateCalc` into your project manually. Put `Sources/DateCalc` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

## Requirements

- iOS 14.0+ | macOS 11+
- Swift 5+

## Usage

First, add `import DateCalc` on every `swift` file you would like to use `DateCalc`. ...

```swift
import DateCalc
import SwiftUI

struct ContentView: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        Button("🎉") {
            counter += 1
        }
        
    }
}

```

### Parameters
...

### Examples

#### Color and Size Configuration

<p align="center">
  <img src="./Gifs/color.gif" width="150" />
</p>

```swift
.confettiCannon(counter: $counter, colors: [.red, .black], confettiSize: 20)
```

#### Repeat Configuration

<p align="center">
  <img src="./Gifs/repeat.gif" width="150" />
</p>

```swift
.confettiCannon(counter: $counter, repetitions: 3, repetitionInterval: 0.7)
```

#### Firework Configuration

<p align="center">
  <img src="./Gifs/explosion.gif" width="150" />
</p>

```swift
.confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
```

## Contributors

All issue reports, feature requests, pull requests and GitHub stars are welcomed and much appreciated.

## Author

...

## License

`DateCalc` is available under the MIT license. See the ... file for more info.

## Projects

The following projects have integrated DateCalc in their App.
- ...
