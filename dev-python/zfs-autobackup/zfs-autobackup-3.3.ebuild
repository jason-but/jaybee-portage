# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{10..13} )

inherit distutils-r1
inherit pypi

DESCRIPTION="Easy and reliable ZFS autobackup tool for snapshotting, thinning and remote replication"
HOMEPAGE="https://github.com/psy0rz/zfs_autobackup"

#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

#inherit git-r3

#EGIT_REPO_URI="https://github.com/psy0rz/zfs_autobackup.git"
#S="$WORKDIR"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~riscv ~x86"
IUSE=""

RDEPEND=">=dev-python/colorama-0.4.4[${PYTHON_USEDEP}]
         sys-block/mbuffer"

distutils_enable_tests pytest

