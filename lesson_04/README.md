# Lesson 04: SwiftUI basics, SPM

The purpose of this lesson to introduce you framework SwiftUI. With the examples which we did on previous lecutres you will be able to rewrite them into SwiftUI.

## What you will learn

- SwiftUI basics: View protocol, Content, body, Stacks, Views etc.
- Property wrappers: @State, @Binding, @Observable / @Published, @Environment
- ScrollViews, List, Difference between Stack and Lazy Stack, Grids
- Dependency Injection, Generics, Property Wrapers
- DispatchGroup / Async Await calls
## Prerequisites

The student should be familiar with previous lectures:

- [Lesson 01: Swift Programming Language](./lesson_01/)
- [Lesson 02: iOS, UIKit, MVC](./lesson_02/)
- [Lesson 03: NewsFeed App - using UIKit and MVVM+C architecture](./lesson_03/)

> Many parts of SwiftUI directly build on top of existing UIKit components. Many other parts don't – they are new controls rendered by SwiftUI and not UIKit.

## iOS Application which you will build
- **MagicButtonSwiftUI** - simple button that changes backround color randomly
  - During building this app you will learn how to start the project from scratch in SwiftUI
  - You will learn how to make a simple views and layout them
  - Button with action to change state
  - View styling
- **SimpleDelegateSwiftUI** - example how we can interpret UIKit delegates approach in SwiftUI using @Binding
  - The difference between @State and @Binding
  - View styling, Modifiers
  - TextView and alerts
- **ListExample** - `UITableView`-like application implemented in SwiftUI
- **PhotoCollectionSwiftUI** - An application with collection of photos
  - Grid
- **ImageFromWeb**
  - How to fetch image data from the web and show it in the view
  - How to cache image