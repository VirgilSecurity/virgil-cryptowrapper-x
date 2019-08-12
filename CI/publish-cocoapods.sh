sudo gem install cocoapods --pre;
pod repo update;
pod trunk push VirgilCryptoFoundation.podspec;
pod repo update;
pod trunk push VirgilCryptoPythia.podspec;
pod trunk push VirgilCryptoRatchet.podspec;
