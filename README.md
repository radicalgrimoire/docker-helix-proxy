# docker-helix-proxy

This is the Dockerfile prepared by radicalgrimoire(六魔辞典).
Container image files are available in GithubPackage, so feel free to use them if you are interested.

# How to use

## Edit docker-compose.yml

```
    environment:
      P4PORT: ssl:p4d:1666   ← edit your perforce server addr
```

## Built Container command

```
docker-compose -f docker-compose.yml up -d
```

