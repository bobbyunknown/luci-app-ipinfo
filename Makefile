# This is open source software, licensed under the MIT License.
#
# Copyright (C) 2024 BobbyUnknown


include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ipinfo
PKG_VERSION:=2.5.0
PKG_RELEASE:=1

PKG_MAINTAINER:=BobbyUnknown <bobbyun.known88@gmail.com>

LUCI_TITLE:=LuCI for IP Info
LUCI_DEPENDS:=+luci-base +curl
LUCI_PKGARCH:=all

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
  PKGARCH:=$(LUCI_PKGARCH)
endef

define Package/$(PKG_NAME)/description
  LuCI interface for IP Info, a tool for showing IP Info.
endef

define Build/Prepare
	# No preparation steps required
endef

define Build/Compile
	# No compilation steps required
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/ipinfo $(1)/etc/config/

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-ipinfo.json $(1)/usr/share/luci/menu.d/

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-ipinfo.json $(1)/usr/share/rpcd/acl.d/

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/
	$(CP) ./htdocs/luci-static/resources/view/ipinfo.js $(1)/www/luci-static/resources/view/

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/status/include/
	$(CP) ./htdocs/luci-static/resources/view/status/include/01_ipinfo.js $(1)/www/luci-static/resources/view/status/include/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))