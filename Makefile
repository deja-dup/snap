# -*- Mode: Makefile; indent-tabs-mode: t; tab-width: 2 -*-
#
# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: Michael Terry

.PHONY: snap
snap:
	rm -f *.snap
	snapcraft snap --use-lxd
	snap install ./*.snap --classic --dangerous

.PHONY: clean
clean:
	rm -rf *.snap

.PHONY: lint
lint:
	reuse lint
