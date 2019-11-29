#
# Be sure to run `pod lib lint PlainExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PlainExtension'
  s.version          = '0.0.4'
  s.summary          = 'Handy Swift extensions.'
  s.description      = <<-DESC
  A plain collection of Swift extensions to help speed up development.
  DESC
  s.homepage         = 'https://github.com/twentyseven/PlainExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'twentyseven' => 'trongbuituan@gmail.com' }
  s.source           = { :git => 'https://github.com/twentyseven/PlainExtension.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'PlainExtension/Sources/**/*'
  s.swift_versions = '5.0'
end
