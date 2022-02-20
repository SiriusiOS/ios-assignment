# Assignment

## Prerequirements

* Xcode 12.5.1 or higher

## Project support iOS version

* iOS 14.0 onwards

## How to Build and Debug

```bash
git clone https://github.com/diepnn01/ios-assignment.git
cd ios-assignment
open ios-assignment.xcodeproj
Select target "ios-assignment" and device, and Cmd + R.
```

## Project structure

* ios-assignment App
* Application/Dependencies: Initialize services, they will be injected into viewcontrollers.
* Application/Networking: Reposibilty to connect API.
* Application/Screens: Build UI, layout screen
* Application/Models: Define objects to bind data into UI, and define object to communicate with API.
* Application/Repositories: Handle logic and prepare data for each screen.
* Application/Utils: Define common functions, initialize extension
* Application/Store: Define classes, help us cache data that will be used in some screens

