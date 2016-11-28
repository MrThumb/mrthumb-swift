Pod::Spec.new do |s|
    s.name             = 'MrThumb'
    s.version          = '0.1.0'
    s.summary          = 'Swift/Objective-C library for MrThumb API'
    s.homepage         = 'https://github.com/MrThumb/mrthumb-swift'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Martin Fernandez' => 'fmartin91@gmail.com' }
    s.source           = { :git => 'https://github.com/MrThumb/mrthumb-swift.git', :tag => s.version.to_s }

    s.ios.deployment_target = '8.0'
    s.source_files = 'mrthumb/Classes/**/*'
    s.dependency 'HMACSigner', '~> 1.0'
end
