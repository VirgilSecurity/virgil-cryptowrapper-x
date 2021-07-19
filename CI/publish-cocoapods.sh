pod trunk push VirgilCryptoFoundation.podspec;

rm -fr ~/.cocoapods/repos;
rm -fr ~/Library/Caches/CocoaPods/;
pod setup;
pod repo update;

pod trunk push VirgilCryptoPythia.podspec;
pod trunk push VirgilCryptoRatchet.podspec;
