#!/system/bin/sh

DRIVERS="panel_event_notifier qts goodix_ts focaltech_fts hapticdrv qcom-hv-haptics"
MODULES_DIR="/lib/modules"

for d in $DRIVERS; do
  lsmod | grep -q "^$d" && continue
  path=$(find "$MODULES_DIR" -name "$d.ko" | head -n 1)
  if [ -f "$path" ]; then
    insmod "$path"
    echo "Force inserted module: $d" >>/tmp/modules.log
  fi
done
