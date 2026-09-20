################################################################################
#
# pluto-gpo-ptt
#
################################################################################

PLUTO_GPO_PTT_SITE = $(BR2_EXTERNAL_ADI_PATH)/../../../apps/pa_gpo
PLUTO_GPO_PTT_SITE_METHOD = local
PLUTO_GPO_PTT_LICENSE = GPL-2.0+
PLUTO_GPO_PTT_DEPENDENCIES = libiio

# The source tree is shared with the superproject at apps/pa_gpo.
define PLUTO_GPO_PTT_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
		-I$(@D) \
		$(@D)/pluto_gpo_ptt.c \
		-o $(@D)/pluto_gpo_ptt \
		-liio
endef

define PLUTO_GPO_PTT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pluto_gpo_ptt \
		$(TARGET_DIR)/usr/bin/pluto_gpo_ptt
	$(INSTALL) -D -m 0755 $(@D)/pluto_gpo_ptt.sh \
		$(TARGET_DIR)/usr/bin/pluto_gpo_ptt.sh
endef

$(eval $(generic-package))
