ifeq ($(KERNELRELEASE), )
KERNELDIR := /lib/modules/$(shell uname -r)/build
PWD :=$(shell pwd)
default:
	$(MAKE) -C $(KERNELDIR)  M=$(PWD)  
clean:
	rm -rf *.mk .tmp_versions Module.symvers *.mod.c *.o *.ko .*.cmd Module.markers modules.order *.a *.mod
load:
	insmod ch34x_pis.ko
unload:
	rmmod ch34x_pis
install: default
	insmod ch34x_pis.ko || true
	mkdir -p /lib/modules/$(shell uname -r)/kernel/drivers/usb/misc || true
	cp -f ./ch34x_pis.ko /lib/modules/$(shell uname -r)/kernel/drivers/usb/misc/ || true
	depmod -a
uninstall:
	rm -rf /lib/modules/$(shell uname -r)/kernel/drivers/usb/misc/ch34x_pis.ko || true
	depmod -a
else
	obj-m := ch34x_pis.o
endif
