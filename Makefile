# Program dependencies
DVPL = dvpl
CP = cp
RM = rm
7Z = 7z
CD = cd
FIND = find
MKDIR = mkdir

# Mod constants
# Mod full name
WMOD_TITLE = Prebattle RandomQueue Remake
# One or more of: (pc|android|ios|any)
WMOD_INITIALTARGETPLATFORM = any
# (N.N.N[+|[-N.N.N]]|any)
WMOD_INITIALTARGETPATCH = any
# (wg|lg|Any)
WMOD_INITIALTARGETPUBLISHER = any

# Compress to dvpl (n|y)
WMOD_DVPLIZE = y

# Mod variables
WMOD_NAME := $(shell echo $(WMOD_TITLE) | tr '[:upper:] ' '[:lower:]-')
WMOD_TARGETPLATFORM ?= $(WMOD_INITIALTARGETPLATFORM)
WMOD_TARGETPATCH ?= $(WMOD_INITIALTARGETPATCH)
WMOD_TARGETPUBLISHER ?= $(WMOD_INITIALTARGETPUBLISHER)
WMOD_VERSION=$(shell git tag | head -n 1)

WMOD_PACKAGENAME = wotb_$(WMOD_NAME)_$(WMOD_VERSION)_$(WMOD_TARGETPLATFORM:any=anyplat)_$(WMOD_TARGETPUBLISHER:any=anypub)_$(WMOD_TARGETPATCH:any=anypatch)

WOTB_PACKAGENAME = net.wargaming.wot.blitz
ifeq ($(WMOD_TARGETPUBLISHER), lg)
	WOTB_PACKAGENAME = com.tanksblitz
endif

BUILDDIR = build
MEDIADIR = public/media
SCRIPTSDIR = scripts

WOTB_DATADIR = Data
ifeq ($(WMOD_TARGETPLATFORM), android)
	WOTB_DATADIR = $(WOTB_PACKAGENAME)/files/packs
endif

WMOD_INSTALLDIR = /sdcard/Android/data/$(WOTB_DATADIR)


### Rules
all: build

build:
	$(MKDIR) -p $(BUILDDIR)/$(WOTB_DATADIR)
	$(CP) -R src/* $(BUILDDIR)/$(WOTB_DATADIR)
ifeq ($(WMOD_DVPLIZE), y)
	$(CD) $(BUILDDIR)/$(WOTB_DATADIR) && $(DVPL) c
endif

install: build
	$(CP) -R $(BUILDDIR)/$(WOTB_DATADIR)/* $(WMOD_INSTALLDIR)

.PHONY: uninstall
uninstall:
	$(CD) src && $(FIND) -exec rm -r -f $(WMOD_INSTALLDIR)/{} +

#description:
#	scripts/make-desc.sh

.PHONY: package
package: build
	$(CD) $(BUILDDIR) && $(7Z) a $(WMOD_PACKAGENAME).zip $(WOTB_DATADIR)

.PHONY: clean
clean:
	-$(FIND) $(BUILDDIR) -exec $(RM) -R -f {} +
