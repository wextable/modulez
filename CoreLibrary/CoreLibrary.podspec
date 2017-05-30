Pod::Spec.new do |s|
  s.name         = 'CoreLibrary'
  s.version      = '0.1.0'
  s.license      = { :type => 'MF' }
  s.summary      = 'CoreLibrary'

  s.ios.deployment_target = '9.0'

  s.homepage = 'https://github.com/wextable/modulez'
  s.source   = { :git => 'https://github.com/wextable/modulez' }
  s.authors = { 'Developers' => 'iOSDev@mobileforming.com' }

  s.source_files = 'CoreLibrary/*.swift'
end
