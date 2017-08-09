source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.1'

use_frameworks!

target 'LinPhoneSwiftExample' do
	pod 'BelledonneToolbox', :path => '~/developer/LinPhoneSwift'
	pod 'LinPhoneSwift', :path => '~/developer/LinPhoneSwift'
	
end

post_install do |installer|
    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['SWIFT_INCLUDE_PATHS'] = '$SRCROOT/liblinphone-sdk/iOS/apple-darwin/include'
    end
end
