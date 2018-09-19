_(optional)_

### Add your public SSH key to source control systems.

This is optional if you are using [ssh-agent](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/), which the KDK automatically forwards.  Otherwise, you may directly configure the pre-generated ssh key which is used to connect to the KDK, within each source control provider.

Add content of ssh public key `~/.kdk/ssh/id_rsa.pub`

* To your [Github Account Keys](https://github.com/settings/keys)
* To your Bitbucket Server https://<BITBUCKET-SERVER>/bitbucket/plugins/servlet/ssh/account/keys
