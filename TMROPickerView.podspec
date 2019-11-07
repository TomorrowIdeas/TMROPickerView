Pod::Spec.new do |spec|
    spec.name         = "TMROPickerView"
    spec.version      = "0.0.1"
    spec.summary      = "A simple UIPickerView subclass for iOS written in Swift"
    spec.description  = <<-DESC
    A UIPickerView subclass that uses generics to select and display strings.
                    DESC

    spec.homepage     = "https://github.com/TomorrowIdeas/TMROPickerView"
    spec.license      = { :type => "MIT", :file => "LICENSE" }
    spec.author       = { "benji" => "benji@tomorrow.me" }

    spec.ios.deployment_target = "11.2"
    spec.swift_version = "4.2"
    spec.source        = { :git => "https://github.com/TomorrowIdeas/TMROPickerView.git", :tag => "#{spec.version}" }
    spec.source_files  = "TMROPickerView/**/*.{h,m,swift}"
end
