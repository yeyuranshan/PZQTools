
Pod::Spec.new do |s|
  s.name         = "Tools"
  s.version      = "0.0.2"
  s.summary      = "panzhengquan the base class"


  s.description  = <<-DESC
			    panzhengquan simple tools,yyyy
                   DESC

  s.homepage     = "https://github.com/yeyuranshan/PZQTools"
  

 #s.license      = 'MIT'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "yeyuranshan" => "609004893@qq.com" }

  s.source       = { :git => "https://github.com/yeyuranshan/PZQTools.git", :tag =>  s.version.to_s}


  s.source_files  = 'Tools/Tools/PANTools/BaseTools/*.{h,m}'
  #s.exclude_files = "Classes/Exclude"
end
