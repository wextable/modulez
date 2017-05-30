# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

workspace 'Modulez'

target 'ModulezApp' do
  project 'ModulezApp/ModulezApp'
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ModulezApp
  pod 'CoreLibrary',                    :path => 'CoreLibrary'
  pod 'ModuleCheckIn',                  :path => 'ModuleCheckIn'
  pod 'ModuleDKey',                     :path => 'ModuleDKey'
  pod 'ModuleDKeyWithOnlyTravelDocs',   :path => 'ModuleDKeyWithOnlyTravelDocs'
  pod 'ModuleStays',                    :path => 'ModuleStays'

  target 'ModulezAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ModulezAppUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
