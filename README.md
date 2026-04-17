# ![Logo](.github/Icon-40.png) Amperfy (hisgarden fork)

> Fork of [Amperfy by BLeeEZ](https://github.com/BLeeEZ/amperfy) — Mac Catalyst build signed with a Developer ID certificate, notarized by Apple, and distributed via a Homebrew tap. CarPlay/Siri entitlements are stripped (personal Developer account can't issue them); everything else matches upstream.

## Basics

Amperfy is an iOS/iPadOS/macOS app written in Swift to interact with an [Ampache](http://ampache.github.io) or [Subsonic](http://www.subsonic.org) server.

### iOS

<img src=".github/Screenshots/Player.jpg" width="250" alt="Screenshot of the Amperfy player" /> &nbsp;
<img src=".github/Screenshots/AlbumDetail.jpg" width="250" alt="Screenshot of the Amperfy artist detail view" /> &nbsp;
<img src=".github/Screenshots/Library.jpg" width="250" alt="Screenshot of the Amperfy library view" />

> iOS install is not provided by this fork. For the App Store iOS build, see [upstream Amperfy](https://github.com/BLeeEZ/amperfy#readme).

### macOS (Homebrew)

```
brew tap hisgarden/amperfy
brew install --cask amperfy
```

Signed with a Developer ID certificate and notarized by Apple — installs cleanly, no Gatekeeper workaround needed.

See [releases](https://github.com/hisgarden/amperfy/releases) for changelog.

<img src=".github/Screenshots/macOS-Playlist.png" width="750" alt="Screenshot of the Amperfy playlist view in macOS" />

## Features

- Multi account
- Offline mode
- CarPlay *(upstream only — stripped in this fork's entitlements)*
- Gapless playback for appropriate media file formats
- Music, Podcast and Radio support
- Siri play media command, Siri Shortcuts and App Intents *(upstream only — stripped in this fork's entitlements)*
- Equalizer
- Replay gain
- Sleep timer
- 5 star song rating
- Favorite song
- Sleep Timer
- Scrobbling

## Requirements

* Xcode 26, Swift 6

## Getting Started

1. Check out the latest version of the project:
  ```
  git clone https://github.com/hisgarden/amperfy.git
  cd amperfy
  ```

3. Open the `Amperfy.xcodeproj` file.

4. Build and run the "Amperfy" scheme

  >CarPlay and Siri entitlements are already stripped in this fork (commit `9c5e97ce`) so the project signs with a personal Apple Developer team out of the box. To restore those features you need a developer certificate with granted access to `com.apple.developer.playable-content` and `com.apple.developer.siri`, and must re-add the corresponding keys to `Amperfy/Amperfy.entitlements`.

## Releases

Tap releases for this fork are published at [github.com/hisgarden/amperfy/releases](https://github.com/hisgarden/amperfy/releases). Upstream beta testing is tracked at [Amperfy Beta](https://github.com/BLeeEZ/amperfy/issues/25).

## Contribution

Pull requests are always welcome. Please execute `AmperfyKitTests` to ensure code quality. Running tests will trigger [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) to apply the [Google Swift Style Guide](https://google.github.io/swift), as configured by [Google-SwiftFormat-Config](https://github.com/NoemiRozpara/Google-SwiftFormat-Config). You can also apply the code style manually by executing `./BuildTools/applyFormat.sh`.

## Attributions

- [AudioStreaming](https://github.com/dimitris-c/AudioStreaming) by [Dimitris C.](https://github.com/dimitris-c) is licensed under [MIT License](https://github.com/dimitris-c/AudioStreaming/blob/main/LICENSE)
- [MarqueeLabel](https://github.com/cbpowell/MarqueeLabel) by [Charles Powell](https://github.com/cbpowell) is licensed under [MIT License](https://github.com/cbpowell/MarqueeLabel/blob/master/LICENSE)
- [NotificationBanner](https://github.com/Daltron/NotificationBanner) by [Dalton Hinterscher](https://github.com/Daltron) is licensed under [MIT License](https://github.com/Daltron/NotificationBanner/blob/master/LICENSE)
- [ID3TagEditor](https://github.com/chicio/ID3TagEditor) by [Fabrizio Duroni](https://github.com/chicio) is licensed under [MIT License](https://github.com/chicio/ID3TagEditor/blob/master/LICENSE.md)
- [CoreDataMigrationRevised-Example](https://github.com/wibosco/CoreDataMigrationRevised-Example) by [William Boles](https://github.com/wibosco) is licensed under [MIT License](https://github.com/wibosco/CoreDataMigrationRevised-Example/blob/master/LICENSE)
- [VYPlayIndicator](https://github.com/obrhoff/VYPlayIndicator) by [Dennis Oberhoff](https://github.com/obrhoff) is licensed under [MIT License](https://github.com/obrhoff/VYPlayIndicator/blob/master/LICENSE)
- [CallbackURLKit](https://github.com/phimage/CallbackURLKit) by [Eric Marchand](https://github.com/phimage) is licensed under [MIT License](https://github.com/phimage/CallbackURLKit/blob/master/LICENSE)
- [DominantColors](https://github.com/DenDmitriev/DominantColors) by [Den Dmitriev](https://github.com/DenDmitriev) is licensed under [MIT License](https://github.com/DenDmitriev/DominantColors/blob/main/LICENSE)
- [AudioVisualizerKit](https://github.com/Kyome22/AudioVisualizerKit) by [Takuto NAKAMURA (Kyome)](https://github.com/Kyome22) is licensed under [MIT License](https://github.com/Kyome22/AudioVisualizerKit/blob/main/LICENSE)
- [Alamofire](https://github.com/Alamofire/Alamofire) by [Alamofire](https://github.com/Alamofire) is licensed under [MIT License](https://github.com/Alamofire/Alamofire/blob/master/LICENSE)
- [Ifrit](https://github.com/ukushu/Ifrit) by [Andrii Vynnychenko](https://github.com/ukushu) is licensed under [MIT License](https://github.com/ukushu/Ifrit/blob/main/LICENSE.md)
- [swift-collections](https://github.com/apple/swift-collections) by [Apple](https://github.com/apple) is licensed under [Apache License 2.0](https://github.com/apple/swift-collections/blob/main/LICENSE.txt)
- [iOS-swiftUI-spotify-equalizer](https://github.com/urvi-k/iOS-swiftUI-spotify-equalizer) by [urvi koladiya](https://github.com/urvi-k) is licensed under [MIT License](https://github.com/urvi-k/iOS-swiftUI-spotify-equalizer/blob/main/LICENSE)

**Amperfy license:** [GPLv3](https://github.com/hisgarden/amperfy/blob/master/LICENSE)

**Special thanks:** [Dirk Hildebrand](https://apps.apple.com/us/developer/dirk-hildebrand/id654444924) (upstream App Store maintainer)
