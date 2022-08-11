build:
	ant debug
install:
	ant installd
uninstall:
	adb uninstall `xmlstarlet select -T -t -v "//manifest/@package" -n AndroidManifest.xml`
start:
	adb shell am start -n `xmlstarlet select -T -t -v "//manifest/@package" -n AndroidManifest.xml`/`xmlstarlet select -T -t -v "//manifest/@package" -n AndroidManifest.xml`.`xmlstarlet select -T -t -v "//application/activity/@android:name" -n AndroidManifest.xml`
clean:
	ant clean

