# Lesson 02: iOS, UIKit, MVC

## What you will learn

- Access Control, Closures, ARC, Codable, Defer, Protocols
- Tools: xCode
- Foundation
- MVC Architecture
- UIKit, Storyboards
- Accessing Documentation from our code

## Prerequisites

The student should be familiar with previous lectures:

- [Lesson 01: Swift Programming Language](./lesson_01/)

## iOS Application which you will build
- **MagicButton** - simple button that changes backround color randomly
  - During building this app you will learn how to start the project from scratch
  - You will be able to make a project with / without storyboards
  - You will learn how to make a `UIButton` and layout using constrains
- **SimpleDelegate** - example how and why we need Delegates
  - You will learn why we need week references between objects
  - `UILabel` styling
  - How to use `UITextView`
- **TableViewExample** - `UITableView` one of the most usable controllers in iOS
- **PhotoCollection** - An application with collection of photos
  - `UIImageView` and `UIImage`
- **ImageFromWeb**
  - How to fetch image data from the web and show it in the view
  - How to cache image


> What is in iOS?

## Stack:
**CoreOS** -> **Core Services** -> **Media** -> **Cocoa Touch**

### Core OS

`OSX Kernel`, `BSD`, `Mach`, `Sockets`, `Security`, `Power Mangement`, `Keychain Access`, `Certificates`, `File System`, `Bonjour`

### Core Services

`Collections`, `Address Book`, `Networking`, `File Access`, `SQLite`, `Core Location`, `Net Services`, `Threading`, `Preferences`, `URL Utilities`

### Media

`Core Audio`, `OpenAl`, `Audio Mixing`, `Video Playback`, `JPEG, PNG, TIFF`, `PDF`, `Quartz (2D)`, `Core Animation`, `OpenGL ES`

### Cocoa Touch
`Multi-Touch`, `Core Motion`, `View Hierarchy`, `Localization`, `Controls`, `Alerts`, `Web View`, `Map Kit`, `Image Picker`, `Camera`

## MVC

**Model** - Data (from JSON)

**View** - User Interface

**Controller** - Ruller, Connector between the Model and View.
            - Control the data in the view

> What is wrong with MVC?

- Controller becomes a massive.
- Too many responsibilities concentrated in the controller.
- Getting hard to test the controllers.
- MVC - Massive view controllers.

## UIKit

**UIViewController** - controlls lifecycle of the view from the initialization until when view closed
**UIView**           - pretty heavy thing. It's using a lot of memory, because it appears when it should be in the screen but not when UIViewController was created.

- UIViewController has a view.

## Links

- [UIKit](https://developer.apple.com/documentation/uikit)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/guidelines/overview/)