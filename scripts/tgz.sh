set -xe

if [ "$1" == "" ]; then
  echo "no args, Bye!"
  exit 1
fi


cd build
export COPYFILE_DISABLE=1
tar cvzf ../release/static-h2o-$1.tgz --exclude .gitkeep ./

cd ../

echo "Hey! Shoot please."
echo "ghr --username higanworks --token \$GITHUB_TOKEN --replace static-h2o-$1 release/static-h2o-$1.tgz"
