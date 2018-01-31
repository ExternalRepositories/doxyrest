#...............................................................................
#
#  This file is part of the Doxyrest toolkit.
#
#  Doxyrest is distributed under the MIT license.
#  For details see accompanying license.txt file,
#  the public copy of which is also available at:
#  http://tibbo.com/downloads/archive/doxyrest/license.txt
#
#...............................................................................

brew update
brew install lua
brew install expat
brew install ragel

if [ "$BUILD_PACKAGE" != "" ]; then
	brew install fakeroot
fi

exit 0 # ignore any errors
