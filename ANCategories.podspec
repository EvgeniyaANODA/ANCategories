Pod::Spec.new do |spec|
  spec.name     = 'ANCategories'
  spec.version  = '1.0'
  spec.license  = { :type => 'MIT' }
  spec.homepage = 'https://github.com/anodamobi/ANCategories'
  spec.authors  = { 'Oksana Kovalchuk' => 'oksana@anoda.mobi' }
  spec.summary  = 'Useful categories for iOS development'
  spec.source   = { :git => 'https://github.com/anodamobi/ANCategories.git', :tag => '1.0' }

  spec.source_files = "NSArray/*.{h,m}", "NSDate/*.{h,m}", "UIApplication/*.{h,m}", "UIColor/*.{h,m}", "UIFont/*.{h,m}", "UIImage/*.{h,m}", "UIViewController/*.{h,m}"

  spec.public_header_files = "NSArray/*.h", "NSDate/*.h", "UIApplication/*.h", "UIColor/*.h", "UIFont/*.h", "UIImage/*.h", "UIViewController/*.h"

  spec.framework = "Foundation", "UIKit"
  spec.requires_arc = true

  spec.dependency 'ANHelperFunctions', '~> 1.0'
end