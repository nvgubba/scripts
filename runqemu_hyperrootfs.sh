/home/rajesh/work/sifive-qemu-private/inst/bin/qemu-system-riscv64 -device virtio-net-device,netdev=net0,mac=52:54:00:12:35:02 -netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23,tftp=/scratch/nvgubba/sifive-fpga/build/tmp-glibc/deploy/images/qemuriscv64 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -initrd /home/rajesh/work/xvisor/build/guest/rootfs_kvm_riscv64.cpio  -device virtio-mouse-pci -device virtio-keyboard-pci  -machine virt -cpu rv64,x-v=true,vlen=256,elen=64,vext_spec=v1.0,x-h=true,x-b=true -smp 4 -m 1024  -m 1024 -serial mon:stdio -serial null -nographic -device bochs-display -kernel /home/rajesh/work/sifive-fpga/build/tmp-glibc/deploy/images/qemuriscv64/Image -append 'root=/dev/vda rw  mem=1024M ip=dhcp console=ttyS0 console=hvc0 earlycon=sbi ' -bios ./fw_jump.elf
