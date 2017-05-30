Pod::Spec.new do |s|
  s.name         = 'ModuleCheckIn'
  s.version      = '0.1.0'
  s.license      = { :type => 'MF' }
  s.summary      = 'ModuleCheckIn'

  s.ios.deployment_target = '9.0'

  s.homepage = 'https://github.com/wextable/modulez'
  s.source   = { :git => 'https://github.com/wextable/modulez' }
  s.authors = { 'Developers' => 'iOSDev@mobileforming.com' }

  s.source_files = 'ModuleCheckIn/*.swift'
  s.resources = ['ModuleCheckIn/*.storyboard']
  s.dependency 'CoreLibrary'
end
