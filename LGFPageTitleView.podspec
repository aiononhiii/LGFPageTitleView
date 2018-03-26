#
#  Be sure to run `pod spec lint LGFPageTitleView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "LGFPageTitleView"
s.version      = "1.1"
s.summary      = "LGFPageTitleView for ios."
s.homepage     = "https://github.com/aiononhiii/LGFPageTitleView"
s.license      = "MIT"
s.author             = { "aiononhiii" => "452354033@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/aiononhiii/LGFPageTitleView.git", :tag => "1.0.0" }
s.source_files  = "LGFPageTitleView", "LGFPageTitleView/LGFPageTitleView/**/*.{h,m}"
s.framework  = "UIKit"

end
