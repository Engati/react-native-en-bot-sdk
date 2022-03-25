require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-en-bot-sdk"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "12.0" }
  s.source       = { :git => "https://github.com/Engati/react-native-enbotsdk.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"
 
  s.dependency "React-Core"
  s.dependency "ENChatBot"

  s.pod_target_xcconfig =
  {
     'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
     'IPHONEOS_DEPLOYMENT_TARGET' => '12.0',
     'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
