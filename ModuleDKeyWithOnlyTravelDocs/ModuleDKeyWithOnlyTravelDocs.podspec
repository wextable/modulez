Pod::Spec.new do |s|
  s.name         = 'ModuleDKeyWithOnlyTravelDocs'
  s.version      = '0.1.0'
  s.license      = { :type => 'MF' }
  s.summary      = 'ModuleDKeyWithOnlyTravelDocs'

  s.ios.deployment_target = '9.0'

  s.homepage = 'https://github.com/wextable/modulez'
  s.source   = { :git => 'https://github.com/wextable/modulez' }
  s.authors = { 'Developers' => 'iOSDev@mobileforming.com' }

  s.source_files = 'ModuleDKeyWithOnlyTravelDocs/*.swift'
  s.resources = ['ModuleDKeyWithOnlyTravelDocs/*.storyboard']
  s.dependency 'CoreLibrary'
end
