# Excercises: Lesson 5

## News Feed App using SwiftUI

1. Create your own News Feed app using https://newsapi.org using SwiftUI
2. News should be sorted by date
3. Change style of all title fonts as we used when created UIKit NewsFeed App
4. Add image to the row.
5. Add seccond button in error Alert
  - Title: "Fetch again"
  - Action should call `getNews()` method from view model
6. Article View should have:
  - Image of article
  - Title and date in format (19 Aug 2022, 5:40 pm)
  - Article text
  - Add parallax animation how we did it in lesson 4.

### Bonus track: 

7. Implement Logger service
8. Make different style for dark mode - text color, background etc:
```
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Text(colorScheme == .dark ? "In dark mode" : "In light mode")
    }
}
```
9. Add pull to refresh using:
```
  .refreshable {
    // your code should refetch news here
  }
```

### JSON from newsapi.org

```json
{
  "source": {
    "id": null,
    "name": "TAG24"
  },
  "author": "TAG24 NEWS Deutschland GmbH",
  "title": "Diese Sachen für den Garten gibt's bei Höffner gerade zu Hammerpreisen - TAG24",
  "description": "Top Angebote bei Höffner: Am Montag (15.8.) gibt's Gartenmöbel zu Hammerpreisen. Darunter Tische, Stühle, Balkonsets, Hocker, Hängesessel, Bänke, Pavillons.",
  "url": "https://www.tag24.de/anzeige/moebel-hoeffner-angebote-montag-15-08-2022-gartenmoebel-tische-liegen-sessel-hocker-2579019",
  "urlToImage": "https://media.tag24.de/1200x800/9/g/9gwrepdso5hgjvcsgum3z02h96nr1xei.jpg",
  "publishedAt": "2022-08-13T16:56:00Z",
  "content": "Top Angebote bei Höffner: Am Montag (15.8.) gibt's Gartenmöbel zu Hammerpreisen. Darunter Tische, Stühle, Balkonsets, Hocker, Hängesessel, Bänke, Pavillons.Deutschland Großer Abverkauf bei Höffner! A… [+6462 chars]"
}
```