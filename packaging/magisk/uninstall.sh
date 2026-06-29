#!/system/bin/sh

DATADIR=/data/adb/cliproxyapi
for file in "$DATADIR/cliproxyapi.pid" "$DATADIR/watchdog.pid"; do
  [ -f "$file" ] || continue
  pid=$(cat "$file" 2>/dev/null)
  [ -n "$pid" ] && kill "$pid" 2>/dev/null
  rm -f "$file"
done

TERMUX_WRAPPER=/data/data/com.termux/files/usr/bin/cliproxyapi
if [ -f "$TERMUX_WRAPPER" ] && grep -q '/data/adb/modules/cliproxyapi/bin/cli-proxy-api' "$TERMUX_WRAPPER" 2>/dev/null; then
  rm -f "$TERMUX_WRAPPER"
fi
