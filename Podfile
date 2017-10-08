# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'bcard' do
pod 'XCGLogger', '~> 4.0.0'
pod 'SwiftyJSON', '3.1.0'
pod ‘CoreUtilFramework’, :git => ‘https://github.com/akarayelli/CoreUtilFramework.git’, :tag => ‘1.0.1’
pod 'SkyFloatingLabelTextField', '~> 3.0'
pod 'TPKeyboardAvoiding'




end


#Continuous integration sirasinda olusan hatanin cozumu icin kullaniliyor.
#http://devcenter.bitrise.io/docs/cocoapods-frameworks-signing-issue
###################

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

