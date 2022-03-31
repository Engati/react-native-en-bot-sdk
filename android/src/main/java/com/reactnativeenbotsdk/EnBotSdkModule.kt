package com.reactnativeenbotsdk

import android.app.Activity
import android.content.Intent
import android.graphics.Typeface
import com.en.botsdk.Constants.LanguageAlignment
import com.en.botsdk.ui.ChatBotConfig
import com.facebook.react.bridge.Callback
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableMap
import com.facebook.react.bridge.*

class EnBotSdkModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {
//  private var myFailureCallback: Callback? = null
//  private var mySuccessCallback: Callback? = null
//  private val activityEventListener =
//    object : BaseActivityEventListener() {
//      override fun onActivityResult(
//        activity: Activity?,
//        requestCode: Int,
//        resultCode: Int,
//        intent: Intent?
//      ) {
//
//        print(requestCode)
//      }
//    }
//  init {
//    reactContext.addActivityEventListener(activityEventListener)
//  }

  override fun getName(): String {
    return "EnBotSdk"
  }

  // Example method
  // See https://reactnative.dev/docs/native-modules-android
  @ReactMethod
  fun multiply(a: Int, b: Int, promise: Promise) {

    promise.resolve(a * b)
    ChatBotConfig.getInstance().init(
      "7b2f8fe62c8d4176", "botName", true, "default",
      getCurrentActivity(), "botUserId", 100, false, LanguageAlignment.DEFAULT,
      null, null, R.drawable.icon_send, null
    )
    ChatBotConfig.getInstance().launchBot()
  }

  @ReactMethod
  fun launchBot(
    botKey: String, botName: String, brandingKey: String,
    welcomeMsg: Boolean, enableLog: Boolean, userId: String, chatHistorySize: Int,
    showDone: Boolean, closeButtonImage: String, language: Int,
    headerTitleFont: String, headerDescriptionFont: String,
    sendMessageButtonIcon: String, userAttributes: ReadableMap
  ) {

    val languageAlignment =
      if (language == 1) LanguageAlignment.RTL else LanguageAlignment.DEFAULT
    val titleTypeface = Typeface.createFromAsset(
      getCurrentActivity()?.getAssets(),
      "fonts/$headerTitleFont"
    )
    val descriptionTypeface = Typeface.createFromAsset(
      getCurrentActivity()?.getAssets(),
      "fonts/$headerDescriptionFont"
    )
    ChatBotConfig.getInstance().init(
      botKey, botName, welcomeMsg, brandingKey,
      getCurrentActivity(), userId, chatHistorySize, showDone, languageAlignment,
      titleTypeface, descriptionTypeface, R.drawable.icon_send, null
    )
//    this.myFailureCallback = myFailureCallback
//    this.mySuccessCallback = mySuccessCallback
//      ChatBotConfig.getInstance().setDataAttributes(userAttributes)

    ChatBotConfig.getInstance().launchBot(1234)
  }

}
