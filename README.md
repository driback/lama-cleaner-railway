# Lama Cleaner — Railway

CPU deployment for the `a-milenkin/lama-cleaner` project.

The Docker setup follows the repository's CPU Docker configuration:
- Python 3.10.11
- PyTorch 1.13.1 CPU
- torchvision 0.14.1
- Lama Cleaner 1.2.5
- LaMa model
- CPU inference

## Deploy to Railway

1. Create a new Railway project.
2. Choose **Deploy from GitHub Repo**.
3. Select this repository.
4. Railway detects the `Dockerfile`.
5. Deploy.

Railway provides the `PORT` environment variable automatically. The container binds Lama Cleaner to `0.0.0.0`.

## Important

The first request can be slow because the LaMa model may need to be downloaded and loaded.

CPU inference is significantly slower than GPU inference.

For a private API, put authentication in front of the service rather than exposing the Railway URL without protection.

## Source

https://github.com/a-milenkin/lama-cleaner
