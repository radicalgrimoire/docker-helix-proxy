# docker-helix-proxy

This is the Dockerfile prepared by radicalgrimoire(六魔辞典).
Container image files are available in GithubPackage, so feel free to use them if you are interested.

# How to use

## Edit docker-compose.yml

```
    environment:
      P4PORT: ssl:p4d:1666   ← edit your perforce server addr
```

### Cache purge

`P4P_CACHE_PURGE_DAYS` sets the number of inactive days before proxy cache
files are purged. It defaults to `30`; set it to `0` to disable deletion.
The container runs the purge daily at 03:00 Asia/Tokyo time.

```yaml
    environment:
      P4P_CACHE_PURGE_DAYS: 30
```

### Cache preload

Set `DEPOT_PATH` in `scripts/preload-proxy-cache.sh`, then run the script on a
host with the `p4` CLI installed and authenticated. It uses `p4 sync -Z
proxyload` through `ssl:localhost:1777` by default, without writing files to a
client workspace. Override `P4PORT` and optionally `P4USER` in the environment
when needed.

## Built Container command

```
docker-compose -f docker-compose.yml up -d
```

