Pod::Spec.new do |s|
  s.name         = 'DLLinqToObjectiveC'
  s.version      = '0.0.1'
  s.summary      = 'Brings a Linq-style fluent query API to Objective-C.'
  s.author = {
    'Dmitry Lizin' => 'sdkdimon@gmail.com'
  }
  s.source = {
    :git => 'https://github.com/sdkdimon/DLLinqToObjectiveC.git',
    :tag => '0.0.1'
  }
  s.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  s.platform = :ios, '6.0'
  s.platform = :osx, '10.8'
  s.source_files = 'DLLinqToObjectiveC/DLLinqToObjectiveC/Sources/*.{h,m}', 'DLLinqToObjectiveC/DLLinqToObjectiveC/DLLinqToObjectiveC.h'
  s.module_map = 'DLLinqToObjectiveC/DLLinqToObjectiveC/Supporting Files/module.modulemap'
  s.homepage = 'https://github.com/sdkdimon/DLLinqToObjectiveC.git'
  s.requires_arc = true
end
