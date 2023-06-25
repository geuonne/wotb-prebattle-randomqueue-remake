# Program dependencies
CD = cd
CP = cp
RM = rm
PWD = pwd
FIND = find
MKDIR = mkdir
CUT = cut
GREP = grep

CURL = curl
7Z = 7z
DVPL = dvpl_converter
GH = gh
GIT = git
MAKE = make


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
WMOD_PLATFORM ?= $(WMOD_INITIALTARGETPLATFORM)
WMOD_PATCH ?= $(WMOD_INITIALTARGETPATCH)
WMOD_PUBLISHER ?= $(WMOD_INITIALTARGETPUBLISHER)

REV = HEAD
# version from an annotated tag
WMOD_VERSION != $(GIT) describe --abbrev=0 $(REV) 2>/dev/null

# Package name. Needed for Android packages
WOTB_PACKAGENAME = net.wargaming.wot.blitz
ifeq ($(WMOD_PUBLISHER), lg)
	WOTB_PACKAGENAME = com.tanksblitz
endif

# Mod title suitable for naming a package
WMOD_NAME != echo $(WMOD_TITLE) | tr '[:upper:] ' '[:lower:]-'
WMOD_PACKAGENAME = $(WMOD_NAME)_$(WMOD_VERSION)_$(WMOD_PLATFORM:any=anyplat)_$(WMOD_PUBLISHER:any=anypub)_$(WMOD_PATCH:any=anypatch)

# platform-specific game prefix, needed for making base directory for packages
WOTB_PREFIX = .
ifeq ($(WMOD_PLATFORM), pc)
	WOTB_PREFIX = Data
endif
ifeq ($(WMOD_PLATFORM), android)
	WOTB_PREFIX = $(WOTB_PACKAGENAME)/files/packs
endif

# Default unset (impossible to determine where the game is installed)
WOTB_INSTALLDIR = .
ifeq ($(WMOD_PLATFORM), android)
	WOTB_INSTALLDIR = /sdcard/Android/data
endif

# Default unset (impossible to determine where the game is installed)
WMOD_INSTALLDIR = .
ifeq ($(WMOD_PLATFORM), android)
	WMOD_INSTALLDIR = $(WOTB_INSTALLDIR)/$(WOTB_PREFIX)
endif

SRCDIR = src
BUILDDIR = build
MEDIADIR = public/media
DISTDIR = dist/general
TOOLSDIR = tools
_ROOT != $(PWD)

BUILDPLATFORMDIR = $(BUILDDIR)/$(WMOD_PLATFORM)/$(WOTB_PREFIX)

DEPS != find 'src' -type f



### Rules
all: build

build: $(DEPS)
	$(MKDIR) -p $(BUILDPLATFORMDIR)
	$(CP) -R $(SRCDIR)/* $(BUILDPLATFORMDIR)
ifeq ($(WMOD_DVPLIZE), y)
	$(CD) $(BUILDPLATFORMDIR) && $(DVPL) encrypt
endif

install: build
	$(CP) -R $(BUILDPLATFORMDIR)/** $(WMOD_INSTALLDIR)

#description:
#	scripts/make-desc.sh

# Create release on GitHub
.PHONY: release
release:
	$(GH) release create -t $(WMOD_VERSION) $(WMOD_VERSION) $(shell $(FIND) $(DISTDIR) -name "*.zip")

# build packages in general format
.PHONY: dist-general
dist-general: DISTDIR = dist/general
dist-general: build
	$(CD) $(BUILDDIR)/$(WMOD_PLATFORM) && $(7Z) a $(_ROOT)/$(DISTDIR)/$(WMOD_PACKAGENAME).zip $(WOTB_PREFIX)

# build packages as required by Forblitz
.PHONY: dist-forblitz
dist-forblitz: DISTDIR = dist/forblitz
ifneq ($(WMOD_PLATFORM), pc)
dist-forblitz: WMOD_PACKAGENAME = $(WMOD_NAME)_$(WMOD_VERSION)_$(WMOD_PLATFORM)
endif
dist-forblitz: build
ifeq ($(WMOD_PLATFORM), pc)
	$(eval WMOD_PACKAGENAME = $(WMOD_NAME)_$(WMOD_VERSION)_steam)
endif
	$(MKDIR) -p $(DISTDIR)
	$(CD) $(BUILDDIR)/$(WMOD_PLATFORM) && $(7Z) a $(_ROOT)/$(DISTDIR)/$(WMOD_PACKAGENAME).zip $(WOTB_PREFIX)

# build packages for distributing
.PHONY: dist
dist: dist-general

# Clean packages
.PHONY: distclean
distclean:
	$(RM) -r -f dist/

# Clean build artifacts
.PHONY: buildclean
buildclean:
	$(RM) -r -f $(BUILDDIR)

# Clean all
.PHONY: clean
clean: distclean buildclean
