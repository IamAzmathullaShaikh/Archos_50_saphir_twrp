LOCAL_PATH := $(call my-dir)

RAMDISK := $(PRODUCT_OUT)/ramdisk.img
MAKEBOOTIMG := $(OUT)/mkbootimg
RECOVERY_RAMDISK := $(PRODUCT_OUT)/ramdisk-recovery.img
RECOVERY_ARGS := --cmdline bootopt=64S3,32N2,32N2  --base 0x40000000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000 --pagesize 2048

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) --kernel $(OUT)/kernel --ramdisk $(OUT)/ramdisk.img --cmdline bootopt=64S3,32N2,32N2  --base 0x40000000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000 --pagesize 2048 --output $(OUT)/boot.img
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

### Recovery
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MAKEBOOTIMG) \
		$(RECOVERY_RAMDISK) \
		$(recovery_kernel)
	$(call pretty,"Target recovery image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(RECOVERY_ARGS) --output $@ --ramdisk $(RECOVERY_RAMDISK)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
