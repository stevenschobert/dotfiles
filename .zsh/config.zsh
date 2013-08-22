# Path
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:vendor/bundle/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/lib/node:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib/android/ndk:/usr/local/lib/android/sdk/tools

# Rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Android SDK/NDK
export ANDROID_SDK_ROOT="/usr/local/lib/android/sdk"
export NDK_ROOT="/usr/local/lib/android/ndk"
