## `How is it possible to delete a system package without root permission ?`

It's actually not possible.
All system apps are installed on the /SYSTEM partition by the phone's manufacturer. This partition is in read-only and only the manufacturer has the right to write things on through OTA Updates.
System apps also use another partition: the /DATA partition (also called user space). All the users data and cache data are stored on this partition. It basically stores all the modifications you could have done on the phone. All the apps you install are fully stored in there.
FYI, performing a factory reset from recovery is simply doing a wipe of /DATA and a wipe of /cache.
Without the right to mount /SYSTEM as read-write, it is thus impossible to delete system packages from the phone. The only thing you can do is delete its cache and all the related user data. In the end, this method doesn't save any space on your phone.
Note : You understood right. A factory reset will restore all the debloated packages !

## `So what is the point if you can't delete packages from /SYSTEM ?`

The good thing is you can prevent any package to be loaded in memory. That's the trick. Even after a reboot, these process will not be waken up.
This script clears all the system bloat in /DATA and freezes these packages by uninstalling them for the current user (user 0).
This script also fully uninstall bloat apps that are NOT system app. It can fully uninstall them because they are only stored in /DATA.

## `Is this script safe ?`

Yes, but only in the sense that you can't brick your phone. You shouldn't encounter bootloop but... I can't guarantee it 100%.
I try to list all the packages I came across. Even those you should not delete (commented out and outside the array). In this way, you know the purpose of each package.
For my script to be the most accessible, I made some default choices and I encourage you to change them to your taste. You can (and should if you ask me) for instance freeze the Play Store and the Google Play Services. It's what I did on several phones and besides significantly improving battery life, it's not causing to much trouble if you mostly use apps from the F-Droid store.
If you plan to replace stock apps (Gallery, Videos etc...) by other apps, I'd like to propose the install of FOSS replacement in my script, stay tuned.

## `What files are exactly saved by the backup proposed by this script ?`

For now, I use this command to generate the backup :
adb backup -apk -all -system -f "${PHONE:-phone}-`date +%Y%m%d-%H%M%S`.adb"
You can adjust it to your needs. Here what's the parameters do :


 **apk|-noapk **: indicates if the *.apk files should be backed up (default is -noapk)

**shared|-noshared** : enable/disable backup of the device's shared storage / SD card contents (default is -noshared)

**all** : indicates that you want the entire system backed up. you can use the packages filter to just backup specific packages, or use -all for a full system backup.

**system|-nosystem** : indicates if all the system applications and data are included when backing up. (default is - system)

**f** : the path of the *.ab file that will be saved on your computer. This file is a compressed file that contains an archive of the data/apks from your device. Here the name of your save will be the brand's name concatenate with the date.


##  **`IMPORTANT -- What an ADB backup really backs up`**
SAVED : Custom vocabulary, wallpapers, launcher icon positions, apps and their settings.
NOT SAVED : basically all the key telephony features: Contacts, SMS, ringtones, activated input languages, ownername and even some apps (because devs can prevent their apps to be backed up with ADB)
Yeah, default android backup sucks! If you need a true backup, you'd better have to root your phone and to do a NANDROID backup with TWRP.
I let you backup with adb anyways because it' still better than nothing in case of a wrong debloat causing bootloop.

## `There is no debloat list for my phone's brand. Can you add it ?`

If I don't have the phone on hand, I can't do anything... but you do! and it will be very nice if you can do it ! 😃
I'd gladly add your list into my script !
You can work with the packages_lists.txt file the script creates.
