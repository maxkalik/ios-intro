# Excercises: Lesson 4

## Text view with random word

1. Create a new xCode Single View iOS App - UISwift
2. Add `Text` view
3. `Text` view should have a random word from the list:

> Words: xcode, ios, playground, iphone, ipdad, device, development, code

Or you can use random word generator:
> Random word generator: https://url-decode.com/tool/random-word-generator

4. Try to style your text: font, weight, size, color etc.
5. Additionaly you can arrange multiple views in Stack with random information that can be changed on click

## Collection view with Emojies

1. Create a new iOS/SwiftUI project
2. Prepare Grid view with with 4 columns. Each cell should have: width and height * 1.5
3. Make a an array of emojies which you will use as data for the cells in collection view
4. Each cell should have an emoji centered

### Bonus track:
5. Rewrite layout based on rotation
```
// Our custom view modifier to track rotation and
// call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

// An example view to demonstrate the solution
struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("Portrait")
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                Text("Unknown")
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}
```

## Button and Image as a backround

1. Create a new iOS/SwiftUI project and layout a Button and Image as a backround
2. An image should be fetched from the web
3. Prepare an array of url of images (for example 3)
4. Tapping on the Button should change an image by order from array.
5. Images should be cached if the will appear on the screen

> You can get images from https://unsplash.com