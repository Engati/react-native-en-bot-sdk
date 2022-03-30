import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-en-bot-sdk' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const EnBotSdk = NativeModules.EnBotSdk
  ? NativeModules.EnBotSdk
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return EnBotSdk.multiply(a, b);
}

export function launchBot(botKey: String,
  botName: String,
  brandingKey: String | null,
  welcomeMsg: Boolean,
  enableLog: Boolean,
  userId: String,
  chatHistorySize: number,
  showDone: Boolean,
  closeButtonImage: String | null,
  language: number | null,
  headerTitleFont: String | null,
  headerDescriptionFont: String | null,
  sendMessageButtonIcon: String | null,
  userAttributes: Object | null
  ): Promise<string> {
  
  return EnBotSdk.launchBot(
    botKey,
    botName,
    brandingKey,
    welcomeMsg,
    enableLog,
    userId,
    chatHistorySize,
    showDone,
    closeButtonImage,
    language,
    headerTitleFont,
    headerDescriptionFont,
    sendMessageButtonIcon,
    userAttributes
    );
}
