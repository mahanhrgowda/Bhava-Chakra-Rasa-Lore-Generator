# Bhava-Chakra-Rasa Lore Generator

A Dockerized Streamlit app that generates lore based on phoneme-emotion mappings using a fine-tuned GPT-2 model. Model files are downloaded from Google Drive at runtime.

## Setup

1. Replace `your_model_safetensors_file_id`, etc., in `app.py` with your Google Drive file IDs.
2. Deploy on Render using the Dockerfile.

## Deployment

- **Platform**: Render (free tier)
- **Environment**: Docker
- **Port**: Set `PORT=8501` in Render environment variables
- **Build**: The Dockerfile installs dependencies and runs `setup_nltk.py`
- **Start**: Runs `streamlit run app.py --server.port $PORT --server.address 0.0.0.0`

## Notes

- Ensure Google Drive files are publicly accessible or use a service account for private files.
- The app may take 30–60 seconds to start due to Render’s free tier spin-down.