### Print KDK usage information.

```bash
kdk
```

### Configure KDK.

When running `kdk init`, please accept when prompted

Please respond affirmatively when prompted for:

- Keybase directory mounting
- Enabling the SOCKS proxy at default port 8000

```bash
kdk init
```

### Synchronize KDK container with Docker for Desktop KUBECONFIG.

This will start the KDK and copy your host's default KUBECONFIG into the KDK and modify the docker-for-desktop
configuration context to work from within your kdk.

```bash
kdk kubesync
```

### Run the KDK container and log into it.

```bash
kdk ssh
```
