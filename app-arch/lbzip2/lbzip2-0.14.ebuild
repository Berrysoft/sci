# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

DESCRIPTION="Pthreads-based parallel bzip2/bunzip2 filter, passable to GNU tar"
HOMEPAGE="http://freshmeat.net/projects/lbzip2"
SRC_URI="http://lacos.web.elte.hu/pub/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PV}-Makefile.patch
}

src_compile() {
	emake CC=$(tc-getCC) || die "emake failed"
}

src_install() {
	dobin ${PN} || die "Installation of ${PN} failed"
	dodoc ChangeLog README || die "no docs"
	doman ${PN}.1 || die "no man"
}
