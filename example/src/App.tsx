import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { launchBot } from 'react-native-en-bot-sdk';

export default function App() {
  return (
    <View style={styles.container}>
      <Button onPress={buttonPressed} title="Launch Bot" >  </Button>
    </View>
  );
}

function buttonPressed() {
  var userAttribute : Object = { "someData":"someValue" };
  var showWelcomeMsg = true;
  var enableLogs = true
  var showDone = true;
  var chatLimit = 100;
  var language = 0;
 
  launchBot("BOT_KEY","BOT_NAME","BRANDING_KEY",showWelcomeMsg,enableLogs,"USER_ID",chatLimit,showDone,"CLOSE_BUTTON_IMAGE_NAME",language,"HEADER_TITLE_FONT_NAME","HEADER_DESCRIPTION_FONT_NAME","SEND_MESSAGE_BUTTON_ICON_NAME",userAttribute).then (
    (value) => {
      console.log(value)
    }
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
