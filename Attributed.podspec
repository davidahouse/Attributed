Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "Attributed"
  s.version      = "1.0.0"
  s.summary      = "A Swift helper for creating NSAttributedString objects"

  s.description  = <<-DESC
  Creating NSAttributedStrings involve quite a bit of boilerplate code, but with
  Attributed, creating them is easy.
                   DESC

  s.homepage     = "https://github.com/davidahouse/Attributed"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = "MIT"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.authors             = {"David House" => "davidahouse@gmail.com"}

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.ios.deployment_target     = "8.0"
  s.osx.deployment_target     = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target    = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/davidahouse/Attributed.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "Sources"
  s.header_dir    = "Attributed"
  s.module_name   = "Attributed"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true

end
