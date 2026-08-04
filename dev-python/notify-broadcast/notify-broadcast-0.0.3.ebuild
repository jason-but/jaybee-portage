# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Define supported Python implementations
PYTHON_COMPAT=( python3_{11,12,13,14} )

# Use setuptools, flit, maturin, or wheel depending on the package's build system
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Broadcast version of notify-send to allow root processes to send a notification to all users with an active DBUS session"
HOMEPAGE="https://github.com/jason-but/notify-broadcast"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

# Add required runtime/build dependencies if any exist
RDEPEND="dev-python/colorlog dev-python/psutil dev-python/dasbus dev-python/pygobject"
BDEPEND=""

