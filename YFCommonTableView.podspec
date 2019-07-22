#
#  Be sure to run `pod spec lint YFCatagroy.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "YFCommonTableView"
  spec.version      = "1.0.0"
  spec.summary      = "A  user set mode Tbaleview commonly used in iOS projects"

  spec.description  = <<-DESC
            image browser for iOS (powerful, superior performance), 
            an easy way to use.
                   DESC

  spec.homepage     = "https://github.com/YFBig-Heart/YFCommonTableView"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author             = { "刘云飞" => "769544747@qq.com" }
  
  spec.platform     = :ios
  spec.platform     = :ios, "8.0"

 
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #  Supports git, hg, bzr, svn and HTTP.

  spec.source       = { :git => "https://github.com/YFBig-Heart/YFCommonTableView.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "YFCommonTableView/**/*.{h,m}"
  s.resources    = 'Assets/*.png'
  # spec.exclude_files--排除那些文件
  # spec.exclude_files = "YFCatagroy/YFCatagroyHeader.h" 
  # spec.public_header_files = "YFCatagroy/YFCatagroyHeader.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"
  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  spec.frameworks = "Foundation", "UIKit"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
