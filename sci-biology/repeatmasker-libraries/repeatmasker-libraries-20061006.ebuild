# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A special version of RepBase used by RepeatMasker"
HOMEPAGE="http://repeatmasker.org/"
SRC_URI="repeatmaskerlibraries-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/Libraries"

RESTRICT="fetch"

pkg_nofetch() {
	einfo "Please register and download repeatmaskerlibraries-${PV}.tar.gz"
	einfo 'at http://www.girinst.org/'
	einfo '(select the "Repbase Update - RepeatMasker edition" link)'
	einfo 'and place it in '${DISTDIR}
}

src_install() {
	dodir /usr/share/repeatmasker/Libraries
	insinto /usr/share/repeatmasker/Libraries
	doins "${S}/"*
}
