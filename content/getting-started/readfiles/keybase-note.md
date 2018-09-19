[Keybase](https://keybase.io/) makes sharing secrets with your team **much** easier. A Keybase user may be added to one
or more [Keybase Teams](https://keybase.io/docs/teams/index), at which point the team's secret files are accessible
under your local filesystem at `MOUNTPOINT`. Scripts and automation may then locate secrets
within the Keybase filesystem at common paths.

Later in this guide (upon `kdk init`), the `kdk` command will ask to mount the host's Keybase filesytem to the KDK
container at `/keybase`.

Be a good Keybase citizen and ensure you are registered on [keybase.io](https://keybase.io/) displaying your full name
and publishing at least one verification.

Ask your team lead to add you to relevant Keybase teams. This will allow you to access team files at
`MOUNTPOINT/team/<team-name>`.
