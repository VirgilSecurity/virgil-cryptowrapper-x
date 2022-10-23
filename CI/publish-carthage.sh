carthage build --use-xcframeworks --no-skip-current;

# TODO: Should be replaced by carthage archive, when it supports xcframeworks
FRAMEWORKS_PATH=Carthage/Build
find ${FRAMEWORKS_PATH} -mindepth 1 -maxdepth 1 ! -name 'VirgilCrypto*' -exec rm -rvf {} \;
zip -r VirgilCryptoWrapper.xcframework.zip ${FRAMEWORKS_PATH}
carthage update --use-xcframeworks;
