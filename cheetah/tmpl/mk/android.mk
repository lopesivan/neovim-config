build:
	./gradlew assembleDebug

install:
	./gradlew installDebug

uninstall:
	adb uninstall `grep applicationId app/build.gradle | sed 's/.*"\(.\+\)"$$/\1/'`

start:
	adb shell am start -n `grep applicationId app/build.gradle | sed 's/.*"\(.\+\)"$$/\1/'`/`grep applicationId app/build.gradle | sed 's/.*"\(.\+\)"$$/\1/'`.MainActivity
clean:
	#rm -rf ~/.gradle/caches
	rm -rf ./app/build/ build
	#./gradlew cleanBuildCache

