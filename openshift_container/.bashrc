if [ "$HOSTNAME" = "centos7-fixit-pod-3" ]; then
  echo "Secret is:"
  echo "=============="
  echo "citron"
  echo "=============="
  exit 1
else
  echo "Go away!!!"
  exit 1
fi
