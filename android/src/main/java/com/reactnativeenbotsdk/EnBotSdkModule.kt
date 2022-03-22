package com.reactnativeenbotsdk

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.en.botsdk.Constants.LanguageAlignment
import com.en.botsdk.ui.ChatBotConfig

class EnBotSdkModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "EnBotSdk"
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    fun multiply(a: Int, b: Int, promise: Promise) {

      promise.resolve(a * b)
      ChatBotConfig.getInstance().init("7b2f8fe62c8d4176", "botName", true, "default",
        getCurrentActivity(), "botUserId", 100, false, LanguageAlignment.DEFAULT,
        null, null, R.drawable.icon_send, null)
      ChatBotConfig.getInstance().launchBot()
    }

    @ReactMethod
    fun launchBot(botKey: String, botName: String, welcomeMsg: Boolean) {

    }


}
