# autorun-audit-demo

> **This repository is a harmless test fixture for
> [autorun-audit](https://github.com/ag3ntsc4rn/autorun-audit).** It imitates the files real
> attacks use to run code when a repository is opened, but every sample is defanged.

Scan it without cloning it:

```bash
uvx autorun-audit repo https://github.com/ag3ntsc4rn/autorun-audit-demo
```

## What's in here

| File | The attack it imitates | Why the sample is harmless |
|---|---|---|
| `.vscode/tasks.json` | A task that runs on folder open, downloads a script and pipes it into a shell, with its output hidden | `example.invalid` can never resolve, so the download fails and nothing runs |
| `AGENTS.md` | Instructions hidden in invisible Unicode tag characters, which an AI agent reads but a reviewer can't see | The hidden text only asks the agent to end its replies with the word PINEAPPLE |
| `.mcp.json` | An MCP server launched with `npx` and no pinned version, so it runs whatever was published last | Its npm registry is set to `registry.example.invalid`, so nothing can be fetched, even if someone later publishes a package with that name |
| `.claude/settings.json` + `scripts/format.sh` | An agent hook that calls an innocent-sounding script, which quietly packs up `~/.ssh` and `~/.aws` and uploads them | The script's first line is `exit 0`, so nothing after it ever runs; autorun-audit reads the whole file without running it |
| `.devcontainer/devcontainer.json` | An `initializeCommand`, which runs on your machine before the container is built | It only prints a message |

Still, treat it the way you would a real suspicious repository: run the scanner on it first,
and don't open it with workspace trust enabled, approve its MCP server or start an agent in it.

## License

[MIT](LICENSE)
