Pod::Spec.new do |s|
  s.name              = 'MPSCategories'
  s.version           = '0.1.0'
  s.authors           = { 'Matthew Strickland' => 'matthew@idlefusion.com'}
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  s.platform          = :ios, '7.0'
  s.requires_arc      = true
  s.summary           = 'A collection of useful Categories that I use in everyday Objective-C development.'
  s.homepage          = 'https://github.com/mps/MPSCategories'
  s.source            = { :git => 'https://github.com/mps/MPSCategories.git', :tag => "#{s.version}" }
  s.ios.frameworks    = 'UIKit', 'CoreGraphics', 'QuartzCore'
  s.ios.source_files  = 'MPSCategories/Foundation/NS*.{h,m}'
  s.osx.source_files  = 'MPSCategories/Foundation/NS*.{h,m}'
end