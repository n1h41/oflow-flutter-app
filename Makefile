watch:
	@flutter pub run build_runner watch --delete-conflicting-outputs

gen:
	@flutter pub run build_runner build --delete-conflicting-outputs

build-apk:
	@flutter build apk --split-per-abi --release
