FROM python:3.11-slim

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg git build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

# Upgrade pip and install critical build deps first
RUN pip install --upgrade pip setuptools wheel numpy

# Now install the project in editable mode
RUN pip install --no-cache-dir -e .

# Expose Gradio default port
EXPOSE 7860

# Run the demo app
CMD ["python", "gradio_tts_app.py"]
