Pod::Spec.new do |s|
  s.name             = 'feature_map_screen'
  s.version          = '1.0.0'
  s.summary          = 'Map screen feature plugin'
  s.homepage         = 'https://github.com/sattigo/demo_2026'
  s.license          = { :type => 'MIT' }
  s.author           = { 'sattigo' => 'sattigo@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*.swift'
  s.static_framework = true
  s.dependency 'Flutter'
  s.dependency 'YandexMapsMobile'
  s.platform         = :ios, '13.0'
  s.swift_version    = '5.0'

  xcconfig_path = File.join(__dir__, 'local.xcconfig')
  api_key = ''
  if File.exist?(xcconfig_path)
    File.foreach(xcconfig_path) do |line|
      match = line.match(/YANDEX_MAPKIT_API_KEY\s*=\s*(.+)/)
      api_key = match[1].strip if match
    end
  end

  generated_dir = File.join(__dir__, 'Classes', 'Generated')
  FileUtils.mkdir_p(generated_dir)
  File.write(File.join(generated_dir, 'MapScreenApiKey.swift'), <<~SWIFT)
    // Auto-generated — do not edit
    enum MapScreenApiKey {
      static let value = "#{api_key}"
    }
  SWIFT
end
