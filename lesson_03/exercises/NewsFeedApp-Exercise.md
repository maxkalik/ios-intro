# Excercises: Lesson 2

## News Feed App

1. Create your own News Feed app using https://newsapi.org
2. News should be sorted by date
3. Update ArticleViewController
  - Add UILabel - Title of Article
  - Add UILabel or UITextView to show full text of Article. JSON field is - `content`
  - Add UIImageView using URL of image. JSON field is - `urlToImage`

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