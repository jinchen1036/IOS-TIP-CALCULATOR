# Pre-work - *Tip Cal*

**Tip Cal** is a tip calculator application for iOS.

Submitted by: **Jin Chen**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Check background color when choose different tip percentage
- [x] Spilt the cost to 1 - 4 people as well as the default number set in Setting page

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/xJNhqFy.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
- Initially, I was thinking to implement the symbol of people through Unicode or import image. But, later on I figure out that I can simply paste the symbol as text in uilabel.
- Difficult to manage the stepper and picker view function in the same file, keep getting error without separate the default variable update in two functions.

## License

    Copyright [2018] [Jin Chen]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

