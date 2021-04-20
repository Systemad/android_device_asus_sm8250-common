# Device Tree for OnePlus 7T Pro aka Hotdog for TWRP (this should be unified with 7T, but I cannot test since I do not own that device)
## Disclaimer
These are personal test builds of mine. In no way do I hold responsibility if it/you messes up your device.
Proceed at your own risk.

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

## Compile

Sync aosp_r29 manifest:

```
repo init --depth=1 -u https://android.googlesource.com/platform/manifest -b android-11.0.0_r29
```

Make a directory named local_manifest under .repo, and create a new manifest file, for example hotdog.xml
and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="github"
	fetch="https://github.com/" />

<project path="device/oneplus/hotdog"
	name="systemad/android_device_oneplus_hotdog"
	remote="github"
	revision="a11k1" />
</manifest>

```

Sync the sources with

```
repo sync
```

To build, execute these commands in order

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch twrp_hotdog-eng (sometimes you may have to cd into device/oneplus/hotdog and lunch there)
mka adbd recoveryimage
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/hotdog/recovery.img 

# Since 7T / Pro has a dedicated recovery parition, you can flash the recovery with
fastboot flash recovery recovery.img
```

#### Working
- [X] Flashing ROMs (AOSP and OOS)
- [X] ADB (+ sideload)
- [X] all important partitions listed in mount/backup lists
- [X] MTP export
- [X] decrypt /data (Custom ROM only)
- [X] Backup to internal/microSD (Custom ROM only)
- [X] Restore from internal/microSD (Custom ROM only)
- [X] F2FS/EXT4 Support, exFAT/NTFS where supported
- [X] backup/restore to/from external (USB-OTG) storage
- [X] update.zip sideload
- [X] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)

#### Not working - OxygenOS specific
- [ ] decrypt /data (OxygenOS, hardware problem or something preventing mounting data)
- [ ] Backup to internal/microSD
- [ ] Restore from internal/microSD
- [ ] partition SD card
- [ ] format data (untested)
- [ ] MTP export (because OOS can't decrypt data)

##### Credits
- CaptainThrowback for original trees.
- mauronofrio for original trees.
- TWRP team and everyone involved for their amazing work.
