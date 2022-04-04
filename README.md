# react-native-en-bot-sdk

react native plugin for ENBotSDK

## Installation

```sh
npm install react-native-en-bot-sdk
```

## Usage

```js
import { launchBot } from 'react-native-en-bot-sdk';

// ...

var userAttribute : Object = { "someData":"someValue" };
  var showWelcomeMsg = true;
  var enableLogs = true
  var showDone = true;
  var chatLimit = 100;
  var language = 0;
 
  launchBot(
  "BOT_KEY",
  "BOT_NAME",
  "default",
  showWelcomeMsg,
  enableLogs,
  "USER_ID",
  chatLimit,
  showDone,
  "CLOSE_BUTTON_IMAGE_NAME",
  language,
  "Montserrat-Regular.ttf",
  "Montserrat-Regular.ttf",
  "original_cock.png",
  userAttribute).then (
    (value) => {
      console.log(value)
    }
  );

// ...

```
## Documentation
```js
launchBot method accepts below parramters
/**
 * 
 * @param botKey Bot key given by the service provider.
 * @param botName Bot name which will appearn on header.
 * @param brandingKey Branding Key to be passed for bot.
 * @param welcomeMsg Enable welcome message flow by passing true.
 * @param enableLog Enable log by passing true.
 * @param userId User Identifier for bot.
 * @param chatHistorySize Chat history size needs to be cached on device.
 * @param showDone Boolean, pass true if done button on top right needs to be visible.
 * @param closeButtonImage Custom image name for close button. 
 * @param language Pass 0 for LTR and 1 for RTL language text alignment 
 * @param headerTitleFont Custom font name for header title.
 * @param headerDescriptionFont Custom font name for header description.
 * @param sendMessageButtonIcon Custom image name for send message button. 
 * @param userAttributes Map/JSON object of user attributes needs to be passed to the bot.
 * @returns Returns when pressed done button.
 */
```
## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
