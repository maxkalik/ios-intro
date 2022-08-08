# iOS, UIKit

## What you will learn

- iOS
- Tools: xCode
- Foundation
- MVC Architecture
- UIKit
- Accessing Documentation from our code

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

> What wrong with MVC?

- Controller becomes a massive.
- Too many responsibilities concentrated in the controller.
- Getting hard to test the controllers.
- MVC - Massive view controllers.

## UIKit

**UIViewController** - controlls lifecycle of the view from the initialization until when view closed
**UIView**           - pretty heavy thing. It's using a lot of memory, because it appears when it should be in the screen but not when UIViewController was created.

- UIViewController has a view.
