include ../definitions.mk

gamemode_file_prefix = Gfx/Lobby/backgrounds/prebattle
gamemodes != $(YQ) '.[] | key' 0<gamemode_bg.yaml

define download_gamemode_bg =
$(eval url != $(YQ) '.$(i_gamemode)' 0<$@)
$(CURL) '$(url)' | $(MAGICK) - -resize 2048x2048\! '$(PROJECTROOT)/$(SRCDIR)/$(gamemode_file_prefix)/bg_gameMode_$(i_gamemode).packed.webp' $(_STASEP)
endef

define make_gamemode_bg_paths =
$(eval gamemode_bg_paths = $(gamemode_bg_paths) battleQueue.mode.gameMode == eGameMode.$(i_gamemode) -> \"~res:/$(gamemode_file_prefix)/bg_gameMode_$(i_gamemode)\",)
endef

define add_gamemode_bg_path_var =
$(eval _component = (.Prototypes.[] | select(."name" == "RandomQueue")).components.UIDataLocalBindingsComponent.data)
$(eval _value = [["string", "gameModeBGPath", "when $(gamemode_bg_paths) \"\""]] | ... style = "flow" | .[].[] style = "double")
$(YQ) --inplace '$(_component) += ($(_value))' mod_$@ $(_STASEP)
endef

gamemode_bg.yaml: $(PROJECTROOT)/$(SRCDIR)/$(gamemode_file_prefix)/*
	$(foreach i_gamemode,$(gamemodes),$(download_gamemode_bg))

RandomQueue.yaml: gamemode_bg.yaml
	$(CP) $@ mod_$@
	$(foreach i_gamemode,$(gamemodes),$(make_gamemode_bg_paths))
	$(add_gamemode_bg_path_var)
	$(CP) mod_$@ $(PROJECTROOT)/$(SRCDIR)/$(gamemode_file_prefix)/$@
