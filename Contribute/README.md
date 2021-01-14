# How Do I Contribute?

There are a lot of packages descriptions to improve. Some might be incorrect while some are nonexistent. You can donate a list of packages that your phone has, so that we can improve our prepared lists, ensuring that the lists stay relevant for as long as possible. If you want to donate package lists, we will be happy to include your name in the contributors list 😃

Please read the [FAQ](https://github.com/gamerhat18/android-debloat/wiki/FAQ).

You can also add new packages :

1. Fetch the list of all the system packages of your phone. My script automatically exports this list in a file called packages_list.txt after choosing an action in the main menu.

You can directly do it with this command :

```bash
adb shell 'pm list packages -s' | sed -r 's/package://g' | sort > remaining_packages.txt
```

2. Seek new packages not present in the lists. You can use [this script](https://github.com/gamerhat18/android-debloat/wiki/Remove-duplicates) to check if your list has no duplicate with the current lists of the repo.

3. Try to document each new packages and make a merge request or [create an issue](https://github.com/gamerhat18/android-debloat/issues/new/choose).

<br>

### Reverse engineer an APK

- [Apktool](https://ibotpeaches.github.io/Apktool/)
- [Jadx](https://github.com/skylot/jadx)
- [Bytecode Viewer](https://github.com/Konloch/bytecode-viewer)


### Useful apps
- [SD Maid Apps checker feature](https://play.google.com/store/apps/details?id=eu.thedarken.sdm) can be useful to find info about the packages.
- [Stanley app](https://f-droid.org/en/packages/com.oF2pks.applicationsinfo/) or [Apps_packages_info](https://f-droid.org/en/packages/com.oF2pks.applicationsinfo/) on F-droid are also handy.
- [Logcat Reader](https://f-droid.org/en/packages/com.dp.logcatapp/) to easily access device logs
