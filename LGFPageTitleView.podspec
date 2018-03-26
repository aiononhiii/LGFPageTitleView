#
#  Be sure to run `pod spec lint LGFPageTitleView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "LGFPageTitleView" # 项目名称
s.version      = "1.0.1"        # 版本号 与 你仓库的 标签号 对应
s.license      = "MIT"          # 开源证书
s.summary      = "LGFPageTitleView for ios" # 项目简介

s.homepage     = "https://github.com/aiononhiii/LGFPageTitleView" # 你的主页
s.source       = { :git => "https://github.com/aiononhiii/LGFPageTitleView.git", :tag => "1.0.1" }#你的仓库地址，不能用SSH地址
s.source_files  = "LGFPageTitleView", "LGFPageTitleView/LGFPageTitleView/**/*.{h,m}"
s.requires_arc = true # 是否启用ARC
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.frameworks   = "UIKit", "Foundation" #支持的框架

# User
s.author             = { "aiononhiii" => "452354033@qq.com" } # 作者信息
s.social_media_url   = "https://github.com/aiononhiii" # 个人主页

end
