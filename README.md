# Stage Challenge - Linux Learning Docker Environment

An interactive Docker-based learning environment designed to teach beginners fundamental Linux commands, system navigation, and basic security concepts through a progressive challenge system.


## Overview

This project creates a containerized Linux environment with:
- Apache web server hosting an HTML inspection challenge
- SSH access for hands-on Linux command practice
- Progressive challenges teaching file navigation, permissions, archives, text editing, and encryption
- Educational content in French, suitable for beginners


## 🚀 Installation

### 1. Clone the project

### 2. Add host

```bash
sudo echo "127.0.0.1 stage-decouverte.epfl.ch" >> /etc/hosts
```
### 3. Build the docker image

```bash
docker build -t stage-challenge .
```

### 4. Run the container

```bash
docker run -d -p 80:80 -p 2222:22 --name stage-challenge stage-challenge
```

### 5. Launch the challenge into n your browser

[http://stage-decouverte.epfl.ch](http://stage-decouverte.epfl.ch)


## License

This project is for educational purposes.
