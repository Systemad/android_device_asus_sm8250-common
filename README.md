# Device Tree for OnePlus 7T Pro aka Hotdog for TWRP (this should be unified with 7T, but I cannot test since I do not own that device)
## Disclaimer - Unofficial TWRP!
These are personal test builds of mine. In no way do I hold responsibility if it/you messes up your device.
Proceed at your own risk.

### Note
Decryption does not currently work at all, this applies to both custom ROM running A10 and A11.
Android 11 - Decryption, most likely because of keymaster 4.1 and other tree specific things.
Android 10 - Not working, not sure why. I am not on A10 so I cannot test or debug it. Will do that once A11 decryption is working.

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

## Compile

Sync twrp-10.0 manifest:

```
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
```

Add this to .repo/manifests/twrp-extras.xml

```xml
<project name="systemad/android_device_oneplus_hotdog" path="device/oneplus/hotdog" remote="github" revision="android-11" />
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
cd device/oneplus/hotdog
lunch omni_hotdog-eng
mka adbd recoveryimage 
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/hotdog/recovery.img 

# Since 7T / Pro has a dedicated recovery partition, you can flash the recovery with
fastboot flash recovery recovery.img
```

#### Working
- [X] Flashing ROMs (AOSP and OOS)
- [X] ADB (+ sideload)
- [X] all important partitions listed in mount/backup lists
- [X] MTP export
- [ ] decrypt /data - Not working at all (A10/A11)
- [ ] Backup to internal/microSD - Not working
- [ ] Restore from internal/microSD - Not working
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
