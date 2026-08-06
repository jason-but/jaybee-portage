# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Define supported Python implementations
PYTHON_COMPAT=( python3_{11,12,13,14} )

# Use setuptools, flit, maturin, or wheel depending on the package's build system
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Easy and reliable ZFS autobackup tool for snapshotting, thinning and remote replication"
HOMEPAGE="https://github.com/psy0rz/zfs_autobackup"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

# Add required runtime/build dependencies if any exist
RDEPEND=">=dev-python/colorama-0.4.4[${PYTHON_USEDEP}]
         sys-block/mbuffer"

BDEPEND=""

