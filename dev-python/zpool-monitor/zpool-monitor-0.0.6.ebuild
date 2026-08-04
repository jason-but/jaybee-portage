EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="ZPool Status Monitor - A 'pretty' replacement for the 'zpool status' command"

HOMEPAGE="https://github.com/jason-but/zpool-monitor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

# 2. Declare package dependencies
RDEPEND="dev-python/textual"
BDEPEND=""

# 3. Enable the test suite (optional but highly recommended)
distutils_enable_tests pytest
