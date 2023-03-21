Pod::Spec.new do |spec|

  spec.name         = "HyperSolutionFramework"
  spec.version      = "0.0.1"
  spec.summary      = "we are trying to hide source files when it is installed using pod description of HyperSolutionFramework."
  # spec.description  = <<-DESC
  #                  DESC
  spec.homepage     = "https://hyper-cloud.kr/"
  spec.license      = { :type => "MIT", :file => "./LICENSE"}
  spec.author             = { "윤창현" => "gus@hyper-cloud.kr" }
  spec.vendored_frameworks = "HyperSolutionFramework.framework"
  spec.platform     = :ios, "13.0"
  spec.source       = { :http => "https://hypersolution-ios.s3.ap-northeast-2.amazonaws.com/HyperSolutionFramework.zip"}
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  # spec.frameworks = 'UIKit', 'UnityFramework'
  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"
end
