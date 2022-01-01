# OS-Kernel
---
### Build ISO:
- Build: 
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