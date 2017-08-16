#
# Be sure to run `pod lib lint MSVRoundedDraggableUIImageView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSVRoundedDraggableUIImageView'
  s.version          = '0.1.0'
  s.summary          = 'MSVRoundedDraggableUIImageView - simple rounded draggable UIImageView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MSVRoundedDraggableUIImageView - simple rounded draggable UIImageView. IB designable.
                       DESC

  s.homepage         = 'https://github.com/sergemoskalenko/MSVRoundedDraggableUIImageView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sergemoskalenko' => 'skype:camopu-ympo, http://camopu.rhorse.ru/ios' }
  s.source           = { :git => 'https://github.com/sergemoskalenko/MSVRoundedDraggableUIImageView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sergemoskalenko'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MSVRoundedDraggableUIImageView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MSVRoundedDraggableUIImageView' => ['MSVRoundedDraggableUIImageView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
