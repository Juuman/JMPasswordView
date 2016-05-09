Pod::Spec.new do |s|
  s.name         = "JMPasswordView"
  s.version      = "0.0.1"
  s.summary      = "GesturePassword"
  s.description  = <<-DESC
                   DESC
  s.homepage     = "https://github.com/Juuman/JMPasswordView"
  s.license      = "MIT (example)"
  s.author             = { "Juuman" => "1149368562@qq.com" }
  s.source       = { :git => "https://github.com/Juuman/JMPasswordView.git", :commit => "ec1f0a172eeb54e7e2bd4784a2ab7c0fe531f6e7" }
  s.source_files  = "JMPasswordViewDemo", "JMPasswordViewDemo/JMPasswordView/JMPasswordView/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

end
