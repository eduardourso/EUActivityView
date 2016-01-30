#
# Be sure to run `pod lib lint EUActivityView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "EUActivityView"
  s.version          = "0.1.0"
  s.summary          = "EUActivityView is customizable activity indicator written in Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
            Lightweight Swift customizable activity indicator. Really simple to use, just add the class follow the intructions
                       DESC

  s.homepage         = "https://github.com/eduardourso/EUActivityView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Eduardo Urso" => "eduardourso@gmail.com" }
  s.source           = { :git => "https://github.com/eduardourso/EUActivityView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/duurso'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'EUActivityView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
