#
# Be sure to run `pod lib lint DigitalFare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DigitalFare'
  s.version          = '1.0.4'
  s.summary          = 'Digital fare is a wrapper library helps user calculate price for driver'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Digital fare is a wrapper library helps user calculate prices for driver. Support speech to text, easily to find the way with google API
                       DESC

  s.homepage         = 'https://github.com/althurzard/DigitalFare.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nguyen Quoc Vuong' => 'nguyen_quocvuong@hotmail.com' }

  s.source           = { :git => 'https://github.com/althurzard/DigitalFare.git', :tag => s.version }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_versions = '5'

  s.source_files = 'DigitalFare/Classes/*.{h,m,swift}'
  
  # s.resource_bundles = {
  #   'digital-fare' => ['digital-fare/Assets/*.png']
  # }
  s.frameworks = 'UIKit', 'MapKit'
  s.static_framework = true
  s.dependency 'GoogleMaps'
  s.dependency 'GooglePlaces'
  s.dependency 'Alamofire', '= 5.0.0-rc.2'
  s.dependency 'ObjectMapper', '~> 3.5.1'
  s.dependency 'AlamofireObjectMapper', '= 6.2.0'
  s.dependency 'DigitalFareUtils'
end
