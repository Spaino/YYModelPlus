#
# Be sure to run `pod lib lint YYModelPlus.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name         = 'YYModelPlus'
    s.summary      = 'High performance model framework for iOS/OSX. Source Code is from YYModel, I added some capabilities to it.'

    s.description  = <<-DESC
    Source Code is from YYModel, I added some capabilities to it.
    Capability 1.Adding a Class Rewrite Method +(YYMapperType)mapperType, Returns an enumerated value, let JSON key auto underscore Case To Camel Case.
    Capability 2.Add an error parameter to collect errors during parsing.
                         DESC

    s.version      = '1.0.0'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.authors      = { 'lianglibao' => 'captain_spaino@163.com' }
    s.homepage     = 'https://github.com/Spaino/YYModelPlus'

    s.ios.deployment_target = '6.0'
    s.osx.deployment_target = '10.7'
    s.watchos.deployment_target = '2.0'
    s.tvos.deployment_target = '9.0'

    s.source       = { :git => 'https://github.com/Spaino/YYModelPlus.git', :tag => s.version.to_s }

    s.requires_arc = true
    s.source_files = 'YYModelPlus/*.{h,m}'
    s.public_header_files = 'YYModelPlus/*.{h}'

    s.frameworks = 'Foundation', 'CoreFoundation'
end
