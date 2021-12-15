#!/system/bin/sh
# automatically set device props for unified tree shared-hardware models/variants


load_op7tpro()
{
    resetprop "ro.product.model" "OnePlus 7T Pro"
    resetprop "ro.product.name" "OnePlus7TPro"
    resetprop "ro.build.product" "OnePlus7TPro"
    resetprop "ro.product.device" "OnePlus7TPro"
    resetprop "ro.vendor.product.device" "OnePlus7TPro"
    resetprop "ro.display.series" "OnePlus 7T Pro"
}

load_op7tpro5g()
{
    resetprop "ro.product.model" "OnePlus 7T Pro 5G"
    resetprop "ro.product.name" "OnePlus7TProNR"
    resetprop "ro.build.product" "OnePlus7TProNR"
    resetprop "ro.product.device" "OnePlus7TProNR"
    resetprop "ro.vendor.product.device" "OnePlus7TProNR"
    resetprop "ro.display.series" "OnePlus 7T Pro 5G"
}

load_op7t()
{
    resetprop "ro.product.model" "OnePlus 7T"
    resetprop "ro.product.name" "OnePlus7T"
    resetprop "ro.build.product" "OnePlus7T"
    resetprop "ro.product.device" "OnePlus7T"
    resetprop "ro.vendor.product.device" "OnePlus7T"
    resetprop "ro.display.series" "OnePlus 7T"
}

project=$(getprop ro.boot.project_codename)
echo "Running unified/variant script with $project..." >> /tmp/recovery.log

case $project in
    hotdogb)
        load_op7t
        ;;
    hotdogg)
        load_op7tpro5g
        ;;
    *)  # hotdog and fallback
        load_op7tpro
        ;;

esac

exit 0
