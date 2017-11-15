Pod::Spec.new do |s|
  s.name             = 'RandomUser'
  s.version          = '0.1.0'
  s.summary          = 'Random fake user information generator'

  s.description      = <<-DESC
  A Swift wrapper over the API provided from randomuser.me, which generate
  random user information covering almost all commonly used fields.
  DESC

  s.homepage         = 'https://github.com/mudox/random-user'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Mudox'
  s.source           = { :git => 'https://github.com/mudox/random-user.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'RandomUser/Source/**/*.swift'
  s.resource_bundle = { 'Assets' => 'RandomUser/Asset/*' }

  s.dependency 'Moya/RxSwift'
end
