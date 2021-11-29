# -*- Mode: Makefile; indent-tabs-mode: t; tab-width: 2 -*-
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: Michael Terry

.PHONY: snap
snap:
	rm -f *.snap
	snapcraft snap
	snap install ./*.snap --classic --dangerous
	! ldd /snap/deja-dup/current/usr/bin/deja-dup | grep -e '=> /usr/' -e '=> /lib/'
	! ldd /snap/deja-dup/current/usr/libexec/deja-dup/deja-dup-monitor | grep -e '=> /usr/' -e '=> /lib/'

.PHONY: clean
clean:
	rm -rf *.snap

.PHONY: lint
lint:
	reuse lint
