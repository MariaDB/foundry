# Pull request builds on Buildbot

Buildbot builds a pull request only when someone with write access comments `/buildbot` on it.

## Using it

- Comment `/buildbot` on the pull request. Buildbot builds its head commit as it is at that moment, and queues the build about a minute later.
- The commit gets a `buildbot/requested` status, "Sent to Buildbot by …". Buildbot reports the build's result as a separate status.
- A new push isn't built until someone comments `/buildbot` again.
- `/buildbot` on a commit that was already sent does nothing. To build it again, use Rebuild in Buildbot.
