# Hacking

## Develop

Start the development webserver so you can view your local edits on
https://localhost:1313

```
make develop
```

## Build

Generate the website locally to `./public`

```
make build
```

## Publish

Publish the website by pushing the locally generated static files to the
`gh-pages` branch of the [kdf repo](https://github.com/cisco-sso/kdf).

```
make publish
```
