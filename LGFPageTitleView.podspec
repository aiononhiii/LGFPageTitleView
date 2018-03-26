
Pod::Spec.new do |s|

s.name        = "LGFPageTitleView"
s.version     = "1.0.0"
s.summary     = "LGFPageTitleView"
s.homepage    = "https://github.com/aiononhiii/LGFPageTitleView"
s.license     = { :type => "MIT" }
s.authors     = { "aiononhiii" => "452354033@qq.com" }

s.requires_arc = true
s.platform     = :ios
s.platform     = :ios, "8.0"
s.source   = { :git => "https://github.com/aiononhiii/LGFPageTitleView.git", :tag => s.version }
s.framework  = "UIKit"
s.source_files = "LGFPageTitleView／LGFPageTitleView/*.{h,m}"
end
