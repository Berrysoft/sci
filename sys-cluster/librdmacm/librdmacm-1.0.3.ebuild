# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SLOT="0"
LICENSE="|| ( GPL-2 BSD-2 )"

KEYWORDS="~amd64"

DESCRIPTION="OpenIB userspace RDMA CM library"
HOMEPAGE="http://www.openfabrics.org/"
SRC_URI="http://www.openfabrics.org/downloads/rdmacm/${P}.tar.gz"
#S="${WORKDIR}/openib-userspace-${PV}/src/userspace/${PN}"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	!sys-cluster/openib-userspace"

src_compile() {
	econf || die "could not configure"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "install failed"
	dodoc README AUTHORS ChangeLog
	docinto examples
	dodoc examples/*.[ch]
}

