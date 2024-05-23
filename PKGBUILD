# Maintainer: Scraft161
pkgname=scdf-dmenu
pkgver=5.3
pkgrel=1
#epoch=1
pkgdesc="dmenu build for SCDF"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Scraft161/SCDF-dmenu"
license=('MIT')
groups=('scdf-gui' 'scdf-x11')
depends=('freetype2' 'libx11' 'libxft' 'libxinerama')
provides=('dmenu' 'scdf-dmenu')
conflicts=('dmenu' 'dmenu-git')
source=(
	"https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz"
	   )
sha256sums=(
	'1a8f53e6fd2d749839ec870c5e27b3e14da5c3eeacbfcb945d159e1d5433795f'
		)

prepare() {
	echo "Patching dmenu"
	cd "$srcdir/.."
	#./patch.sh
}

build() {
	cd "$srcdir/dmenu-${pkgver}"

	# Only copy config if it doesn't already exist
	if ! [-f config.h]; then
		cp config.def.h config.h
	fi

	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/dmenu-${pkgver}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
