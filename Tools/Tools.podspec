
Pod::Spec.new do |s|
  s.name         = "Tools"
  s.version      = "1.0.0"
  s.summary      = "panzhengquan the base class"


  s.description  = <<-DESC
			    panzhengquan simple tools,yyyy
                   DESC

  s.homepage     = "https://github.com/yeyuranshan/PZQTools"
  

  s.license      = "MIT"

  s.author             = { "yeyuranshan" => "609004893@qq.com" }

  s.source       = { :git => "https://github.com/yeyuranshan/PZQTools.git", :tag => "1.0.0" }

  s.source_files  = "Tools/PANTools/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
end
