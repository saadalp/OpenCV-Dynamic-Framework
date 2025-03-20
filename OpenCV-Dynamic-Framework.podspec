Pod::Spec.new do |spec|
  spec.name         = "OpenCV-Dynamic-Framework"
  spec.version      = "4.10.0.3"
  spec.summary      = "OpenCV dynamic framework"
  spec.description  = "From https://github.com/opencv/opencv"
  spec.homepage     = "https://github.com/eddy-lau/OpenCV-Dynamic-Framework.git"
  spec.license      = { :type => '3-clause BSD', :file => 'LICENSE' } 
  spec.author       = "https://opencv.org/" 
  spec.platform     = :ios
  spec.ios.deployment_target = "11.0"
  spec.source       = { 
      :git => "https://github.com/eddy-lau/OpenCV-Dynamic-Framework.git", 
      :tag => "#{spec.version.to_s}" 
  }

  spec.prepare_command = <<-CMD
  ./extract.sh
  CMD

  spec.preserve_paths = "opencv2.xcframework"
  spec.vendored_frameworks = "opencv2.xcframework"
  spec.requires_arc = false
	spec.ios.frameworks = [
    "AssetsLibrary",
    "AVFoundation",
    "CoreGraphics",
    "CoreMedia",
    "CoreVideo",
    "Foundation",
    "QuartzCore",
    "UIKit"
	]

  spec.libraries = "c++"
  spec.pod_target_xcconfig = {
      "CLANG_CXX_LANGUAGE_STANDARD" => "c++17",
      "CLANG_CXX_LIBRARY" => "libc++",
  }
end
