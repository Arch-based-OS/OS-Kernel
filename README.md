# OS-Kernel
---
### Dependencies:
- [Docker](https://github.com/docker)
    - [randomdude/gcc-cross-x86_64-elf](https://hub.docker.com/r/randomdude/gcc-cross-x86_64-elf)
    
- [Qemu](https://www.qemu.org/download/)

---
### Build ISO:
- Build Docker: 
```sh
sudo docker build buildenv -t os-buildenv
```
- Run (Fish):
```sh
sudo docker run --rm -it -v (pwd):/root/env os-buildenv
```
- Run (Bash):
```sh
sudo docker run --rm -it -v $pwd:/root/env os-buildenv
```
- Build ISO:
```sh
make build-x86_64
```
---

## Test the ISO:
```sh
qemu-system-x86_64 -cdrom dist/x86_64/kernel.iso
```