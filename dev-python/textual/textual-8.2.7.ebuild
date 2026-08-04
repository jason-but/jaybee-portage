EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Modern Text User Interface framework"

HOMEPAGE="https://github.com/Textualize/textual"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"

# 2. Declare package dependencies
RDEPEND="dev-python/markdown-it-py dev-python/mdit-py-plugins dev-python/typing-extensions dev-python/platformdirs dev-python/rich"
BDEPEND=""

# 3. Enable the test suite (optional but highly recommended)
distutils_enable_tests pytest
