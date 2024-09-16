#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery:19055488:e1b431ab9d986e1ae5f402750a1766f439f5d309; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/boot:10515328:82e1aa3eafc238b10d5f35c0c4d1cf5e3f561c9b EMMC:/dev/block/platform/mtk-msdc.0/11230000.msdc0/by-name/recovery e1b431ab9d986e1ae5f402750a1766f439f5d309 19055488 82e1aa3eafc238b10d5f35c0c4d1cf5e3f561c9b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
