_(optional)_

### Add your public SSH key to source control systems.

This is optional if you are using [ssh-agent](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/), which
the KDK automatically forwards.  Otherwise, you may directly configure the pre-generated ssh key which is used to
connect to the KDK, within each source control provider.

Add content of ssh public key `~/.kdk/ssh/id_rsa.pub`

* To your [Github Account Keys](https://github.com/settings/keys)
* To your Bitbucket Server https://\<BITBUCKET-SERVER\>/bitbucket/plugins/servlet/ssh/account/keys

### Customing your `.bash_profile`

If you have installed [Keybase](https://keybase.io/), you may customize your bash profile by creating the file
`/keybase/private/<user-keybase-id>/.bash_profile_private`.  The default KDK
[`.bash_profile`](https://github.com/cisco-sso/yadm-dotfiles/blob/master/.bash_profile#L101) will automatically source
the `.bash_profile_private` file from keybase, if it exists.

### Customizing your dotfiles

If you have your own yadm dotfiles repository, you may `kdk init` with the option:
```
--dotfiles-repo string      KDK Dotfiles Repo (default "https://github.com/cisco-sso/yadm-dotfiles.git")
```

The easiest way to create a compatible dotfiles repository is to fork the repository
[yadm-dotfiles](https://github.com/cisco-sso/yadm-dotfiles.git).
