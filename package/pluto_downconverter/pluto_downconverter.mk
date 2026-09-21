################################################################################
#
# pluto-downconverter
#
################################################################################

PLUTO_DOWNCONVERTER_SITE = $(BR2_EXTERNAL_ADI_PATH)/../../../apps/pluto_downconverter
PLUTO_DOWNCONVERTER_SITE_METHOD = local
PLUTO_DOWNCONVERTER_LICENSE = GPL-2.0+
PLUTO_DOWNCONVERTER_DEPENDENCIES = libiio libad9361-iio

# The source tree is shared with the superproject at apps/pluto_downconverter.
define PLUTO_DOWNCONVERTER_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
		-I$(@D) \
		$(@D)/pluto_downconverter.c \
		-o $(@D)/pluto_downconverter \
		-liio -lad9361 -lm
endef

define PLUTO_DOWNCONVERTER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pluto_downconverter \
		$(TARGET_DIR)/usr/bin/pluto_downconverter
endef

$(eval $(generic-package))
