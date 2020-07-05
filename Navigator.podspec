
Pod::Spec.new do |s|
  s.name         = 'Navigator'
  s.version      = '0.1.1'
  s.summary      = 'Customizable UINavigationController-like stack of view controllers.'
  s.homepage     = 'https://github.com/kyleve/Navigator'
  s.license      = { type: 'Proprietary', text: "© 2020 Kyle Van Essen" }
  s.author       = { 'Kyle Van Essen' => 'k@kve.me' }
  s.source       = { git: 'Not Published', tag: "podify/#{s.version}" }

  s.ios.deployment_target = '10.0'

  s.swift_versions = ['5.0']

  s.source_files = 'Navigator/Sources/**/*.{swift}'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Navigator/Tests/**/*.{swift}'
    test_spec.ios.resource_bundle = { 'NavigatorTestsResources' => 'Navigator/Tests/Resources/**/*.*' }

    test_spec.framework = 'XCTest'

    test_spec.requires_app_host = true
  end
end
