include ../definitions.mk

gamemodes != $(YQ) '.[] | key' 0<gamemode_bg.yaml

define make_gamemode_bg_paths =
$(eval gamemode_bg_url != $(YQ) '.$(i_gamemode)' 0<gamemode_bg.yaml)
$(eval gamemode_bg_paths = $(gamemode_bg_paths) battleQueue.mode.gameMode == $(i_gamemode) -> \"$(gamemode_bg_url)\",)
endef

define add_gamemode_bg_path_var =
$(eval _component = (.Prototypes.[] | select(."name" == "RandomQueue")).components.UIDataLocalBindingsComponent.data)
$(eval _value = [["string", "gameModeBGPath", "when $(gamemode_bg_paths) \"\""]] | ... style = "flow" | .[].[] style = "double")
$(YQ) --inplace '$(_component) += ($(_value))' mod_$@ $(_STASEP)
endef

RandomQueue.yaml:
	$(CP) $@ mod_$@
	$(foreach i_gamemode,$(gamemodes),$(make_gamemode_bg_paths))
	$(add_gamemode_bg_path_var)
	$(MKDIR) -p $(PROJECTROOT)/$(SRCDIR)/UI/Screens3/Lobby/Prebattle
	$(CP) mod_$@ $(PROJECTROOT)/$(SRCDIR)/UI/Screens3/Lobby/Prebattle/$@
