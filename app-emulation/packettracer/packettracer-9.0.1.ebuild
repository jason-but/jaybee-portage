# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="Cisco Packet Tracer network simulator (AppImage Extracted)"
HOMEPAGE="https://www.netacad.com/"
SRC_URI="CiscoPacketTracer_901_Ubuntu_64bit.deb"

LICENSE="Cisco"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Cisco requires authentication to download; users must fetch the file manually
RESTRICT="fetch mirror strip"

# System runtime dependencies mapping to the AppImage's internal requirements
RDEPEND="
	sys-fs/fuse:0
	sys-libs/zlib
	media-libs/fontconfig
	media-libs/libglvnd
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libxcb
	x11-libs/libxkbfile
"

DEPEND=""
BDEPEND="
	app-arch/deb2targz
	sys-fs/fuse:0
"

S="${WORKDIR}"

pkg_nofetch() {
	einfo "Please download ${SRC_URI} from your Cisco Networking Academy"
	einfo "or Skills For All account and place it in your DISTDIR directory:"
	einfo "   ${DISTDIR}"
}

src_unpack() {
	# Unpacks the external .deb framework and gets to the raw data archive
	unpacker_src_unpack
}

src_prepare() {
	default

	einfo "Extracting embedded Cisco AppImage..."
	# Make the extracted AppImage executable
	chmod +x opt/pt/packettracer.AppImage || die

	# Execute the AppImage to self-extract into squashfs-root/
	./opt/pt/packettracer.AppImage --appimage-extract || die "Failed to extract AppImage contents"

	# Fix absolute system paths inside the official desktop entry
	einfo "Fixing application paths in desktop file..."
	sed -i -e 's|Exec=.*|Exec=packettracer|g' \
               -e 's|Icon=.*|Icon=packettracer|g' \
	       squashfs-root/CiscoPacketTracer-9.0.1.desktop || die
}

src_install() {
	# Install the fully unpacked squashfs structure directly into /opt/pt
	dodir /opt/pt
	cp -a squashfs-root/* "${ED}/opt/pt/" || die

	# Symlink the internal main execution script/binary to standard system bin
	dodir /usr/bin
	dosym ../../opt/pt/AppRun /usr/bin/packettracer

	domenu squashfs-root/CiscoPacketTracer-9.0.1.desktop

	# Handle the official graphical desktop menu integrations
	if [[ -f squashfs-root/app.png ]]; then
		doicon -s 48 squashfs-root/app.png
	elif [[ -f squashfs-root/usr/share/icons/hicolor/48x48/apps/packettracer.png ]]; then
		doicon -s 48 squashfs-root/usr/share/icons/hicolor/48x48/apps/app.png
	fi

}

pkg_postinst() {
	xdg_pkg_postinst
	einfo "Packet Tracer 9.0.1 has been successfully extracted and deployed to /opt/pt"
	einfo "You can launch it by typing 'packettracer' in your shell environment."
}
