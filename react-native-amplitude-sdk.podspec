require "json"

json = File.read("package.json")
package = JSON.parse(json).deep_symbolize_keys

Pod::Spec.new do |s|
  s.name = package[:name]
  s.version = package[:version]
  s.source = { git: package[:repository][:url] }
  s.source_files = "*.{h,m}"
  s.platform = :ios, "8.0"

  s.dependency "Amplitude-iOS", "~> 3.10.1"
  s.dependency "React"
end
