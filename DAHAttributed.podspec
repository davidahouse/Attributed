Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "DAHAttributed"
  s.version      = "1.1.0"
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
  s.tvos.deployment_target    = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/davidahouse/Attributed.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "Sources"
  s.header_dir    = "Attributed"
  s.module_name   = "Attributed"

  # ――― Exclude Files ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.ios.exclude_files = ['Sources/Attributed+Foundation.swift']
  s.tvos.exclude_files = ['Sources/Attributed+Foundation.swift']
  s.osx.exclude_files = ['Sources/Attributed+UIKit.swift']

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true

end
