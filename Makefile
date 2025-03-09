watch:
	@flutter pub run build_runner watch --delete-conflicting-outputs

gen:
	@flutter pub run build_runner build --delete-conflicting-outputs

build-apk:
	@flutter build apk --split-per-abi --release

apk-zip:
	@cd ./build/app/outputs/flutter-apk/ && zip -r ../../../../android-build.zip *-release.apk

web-zip:
	@cd ./build/web/ && zip -r ../../web-build.zip *
