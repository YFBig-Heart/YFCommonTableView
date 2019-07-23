#
#  Be sure to run `pod spec lint YFCommonTableView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  
  spec.name         = "YFCommonTableView"
  spec.version      = "1.0.1"
  spec.summary      = "A  user set mode Tbaleview commonly used in iOS projects"

  spec.description  = <<-DESC
            image browser for iOS (powerful, superior performance), 
            an easy way to use.
                   DESC

  spec.homepage     = "https://github.com/YFBig-Heart/YFCommonTableView"

  spec.license      = "MIT"

  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  spec.author             = { "刘云飞" => "769544747@qq.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "9.0"



  spec.source       = { :git => "https://github.com/YFBig-Heart/YFCommonTableView.git", :tag => "#{spec.version}" }


  spec.source_files  = "YFCommonTableViewDemo/YFCommonTableView/**/*.{h,m}"
  spec.resource      = "YFCommonTableViewDemo/YFCommonTableView/image.bundle"

  spec.frameworks = "Foundation", "UIKit"


  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
