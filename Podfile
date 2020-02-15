# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
flipperkit_version = '0.31.1'

target 'Twitta' do
  use_frameworks!
  use_modular_headers!
  # Pods for Twitta
  # pod 'FlipperKit', '~>' + flipperkit_version
  # Layout and network plugins are not yet supported for swift projects
  # pod 'FlipperKit/FlipperKitLayoutComponentKitSupport', '~>' + flipperkit_version
  # pod 'FlipperKit/SKIOSNetworkPlugin', '~>' + flipperkit_version
  # pod 'FlipperKit/FlipperKitUserDefaultsPlugin', '~>' + flipperkit_version
  
  # Firebase
  pod 'Firebase/Analytics'
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  # Swift extensions for Firestore
  pod 'FirebaseFirestoreSwift'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if target.name == 'YogaKit'
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.1'
        end
      end
    end
    file_name = Dir.glob("*.xcodeproj")[0]
    app_project = Xcodeproj::Project.open(file_name)
    app_project.native_targets.each do |target|
        target.build_configurations.each do |config|
          if (config.build_settings['OTHER_SWIFT_FLAGS'])
            unless config.build_settings['OTHER_SWIFT_FLAGS'].include? '-DFB_SONARKIT_ENABLED'
              puts 'Adding -DFB_SONARKIT_ENABLED ...'
              swift_flags = config.build_settings['OTHER_SWIFT_FLAGS']
              if swift_flags.split.last != '-Xcc'
                config.build_settings['OTHER_SWIFT_FLAGS'] << ' -Xcc'
              end
              config.build_settings['OTHER_SWIFT_FLAGS'] << ' -DFB_SONARKIT_ENABLED'
            end
          else
            puts 'OTHER_SWIFT_FLAGS does not exist thus assigning it to `$(inherited) -Xcc -DFB_SONARKIT_ENABLED`'
            config.build_settings['OTHER_SWIFT_FLAGS'] = '$(inherited) -Xcc -DFB_SONARKIT_ENABLED'
          end
          app_project.save
        end
      end
      installer.pods_project.save
  end

  target 'TwittaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TwittaUITests' do
    # Pods for testing
  end

end
