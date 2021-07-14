FRAMEWORKS_PATH=Carthage/Build

brew update;
brew outdated carthage || brew upgrade carthage;
carthage build --use-xcframeworks --no-skip-current;

# TODO: Should be replaced by carthage archive, when it supports xcframeworks
rm -r ${FRAMEWORKS_PATH}/VSCCommon.xcframework ${FRAMEWORKS_PATH}/VSCFoundation.xcframework ${FRAMEWORKS_PATH}/VSCPythia.xcframework ${FRAMEWORKS_PATH}/VSCRatchet.xcframework Carthage/Checkouts

zip -r VirgilCryptoWrapper.xcframework.zip Carthage
