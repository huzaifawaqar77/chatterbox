FROM python:3.11-slim

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy repo
COPY . /app

# Install python deps (Chatterbox uses pyproject.toml but pip will work with requirements)
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -e .

# Expose Gradio default port
EXPOSE 7860

# Run the demo app (Gradio UI)
CMD ["python", "gradio_tts_app.py"]
