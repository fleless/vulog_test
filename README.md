# Vulog
## _technical test_

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

NB: this repository is public until I receive your email addresses to give you access

## What is developed ?

- Native splash screen for android and Ios with nightMode/lightMode
> Splash screen containing white/black background on lightMode/nightMode
> And a centered image
- English and French language support
> AppLocalizations implemented with i18n floder containing two json files
> fr.json and en.json containing translated strings
> Default language is english and supporting device language
- Show a list of products
> First screen with list of products
> Every product is englobed in cell where we can see the image, title, description, price
> Category also shown and developed as an enumeration with a code color fo each category
- Refresh list of products
> Just swipe to the bottom whe you are at the top of list
- Show a single product
> Click on a cell and you are navigated to this page  
> Same logic and shown attributes as all products screen   
> Only difference is the desciption fully showed (limited at 7 lines on the first screen)
- unit tests/widget tests
> Presentation logic under test

## Architecture and dependencies

This test uses clean architecure logic with provider as stateManagement handler.
The flutter modular is used for routing and dependency injections
Retrofit and dio for network calls
Mockito for mocking tests/ modular_test to test modular widgets and flutter_test

## Installation

clone the repo or download the zip
Open with the IDE of your choice (prefer android studio for its analyzers and performances stats)

```sh
flutter pub get 
```

## License

MIT

**Smile**