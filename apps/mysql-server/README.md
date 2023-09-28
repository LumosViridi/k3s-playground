# MySQL Server

I was originally using this when I was running Kodi, after switching to JellyFin, this remains on the cluster but is unused at this point in time.

The MySQL engine has problems initing an empty database where storage is mounted via smb due to how files are handled on the fileshare. Switching to NFS fixed this but adds increased latency between MySQL and storage. Probably moving to running the container on the Synology.
