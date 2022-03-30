import ENChatBot
import UIKit

@objc(EnBotSdk)
class EnBotSdk: NSObject {

    var callback : RCTPromiseResolveBlock?

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }

    @objc(launchBot:botName:brandingKey:welcomeMsg:enableLog:userId:chatHistorySize:showDone:closeButtonImage:language:headerTitleFont:headerDescriptionFont:sendMessageButtonIcon:userAttributes:withResolver:withRejecter:)//userAttributes:)
    func launchBot(botKey: String?,
                            botName: String?,
                            brandingKey: String?,
                            welcomeMsg: Bool,
                            enableLog: Bool,
                            userId: String?,
                            chatHistorySize: Int,
                            showDone: Bool,
                            closeButtonImage: String?,
                            language: Int,
                            headerTitleFont: String?,
                            headerDescriptionFont: String?,
                            sendMessageButtonIcon: String?,
                            userAttributes: Any,
                            resolve:@escaping RCTPromiseResolveBlock,
                            reject:RCTPromiseRejectBlock) -> Void {
        callback = resolve
        var lang = ENChatBotConfig.ENChatBotLanguage.default
        if language == 1 {
            lang = ENChatBotConfig.ENChatBotLanguage.rtl
        }
        let userAttrs = RCTConvert.nsDictionary(userAttributes)
        let closeButtonImg = closeButtonImage != nil ? UIImage(named: closeButtonImage!) : nil
        let sendMessageButtonIcn = sendMessageButtonIcon != nil ? UIImage(named: sendMessageButtonIcon!) : nil
        let config = ENChatBotConfig(
                            botKey: botKey ?? "872362873",
                            botName: botName ?? "default",
                            brandingKey: brandingKey,
                            welcomeMsg: welcomeMsg,
                            enableLog: enableLog,
                            userId: userId ?? "xyz",
                            chatHistorySize: chatHistorySize,
                            showDone: showDone,
                            closeButtonImage: closeButtonImg,
                            language: lang,
                            headerTitleFont: headerTitleFont != nil ? UIFont(name: headerTitleFont!, size: 14) : nil,
                            headerDescriptionFont: headerDescriptionFont != nil ? UIFont(name: headerDescriptionFont!, size: 14) : nil,
                            sendMessageButtonIcon: sendMessageButtonIcn,
                            userAttributes: userAttrs
                            )
        let botVC = ENChatBotViewController(chatConfig: config, callBackDelegate: self)
        
        
        DispatchQueue.main.async {
            
            if let controller = UIApplication.shared.keyWindow?.rootViewController {
                let nav = UINavigationController(rootViewController: botVC)
                nav.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                controller.present(nav, animated: true)
            }
        }
                        
    }
}

extension EnBotSdk : ENChatBotCallBack {
    public func didCloseENChatBot(_ withInfo: Any?) {
        callback?(withInfo)
    }
}
