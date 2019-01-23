Pod::Spec.new do |s|
  s.name                        = "VirgilCryptoFoundation"
  s.version                     = "0.2.0-alpha2"
  s.license                     = { :type => "BSD", :file => "LICENSE" }
  s.summary                     = "Contains basic classes for creating key pairs, encrypting/decrypting data, signing data and verifying signatures."
  s.homepage                    = "https://github.com/VirgilSecurity/virgil-crypto-c"
  s.authors                     = { "Virgil Security" => "https://virgilsecurity.com/" }
  s.source                      = { :git => "https://github.com/VirgilSecurity/virgil-cryptowrapper-x.git", :tag => s.version }
  s.ios.deployment_target       = "9.0"
  s.osx.deployment_target       = "10.10"
  s.tvos.deployment_target      = "9.0"
  s.watchos.deployment_target   = "2.0"
  s.public_header_files         = "VirgilCryptoFoundation/VirgilCryptoFoundation.h"
  s.source_files                = "VirgilCryptoFoundation/**/*.{h,mm,swift}"
  s.dependency 'VirgilCryptoCommon', '= 0.2.0-alpha2'
end
