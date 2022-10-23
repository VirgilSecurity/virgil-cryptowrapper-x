Pod::Spec.new do |s|
  s.name                        = "VirgilCryptoRatchet"
  s.version                     = "0.16.3"
  s.swift_version               = "5.0"
  s.license                     = { :type => "BSD", :file => "LICENSE" }
  s.summary                     = "Contains swift for double ratchet crypto operations."
  s.homepage                    = "https://github.com/VirgilSecurity/virgil-cryptowrapper-x"
  s.authors                     = { "Virgil Security" => "https://virgilsecurity.com/" }
  s.source                      = { :git => "https://github.com/VirgilSecurity/virgil-cryptowrapper-x.git", :tag => s.version }
  s.ios.deployment_target       = "11.0"
  s.osx.deployment_target       = "10.9"
  s.tvos.deployment_target      = "11.0"
  s.watchos.deployment_target   = "4.0"
  s.public_header_files         = "VirgilCryptoRatchet/VirgilCryptoRatchet.h"
  s.source_files                = "VirgilCryptoRatchet/**/*.{h,mm,swift}"
  s.dependency 'VirgilCryptoFoundation', '= 0.16.3'
  s.dependency 'VSCCrypto/Common', '= 0.16.3'
  s.dependency 'VSCCrypto/Foundation', '= 0.16.3'
  s.dependency 'VSCCrypto/Ratchet', '= 0.16.3'
end
