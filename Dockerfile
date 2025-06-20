# Use official Python 3.10 slim image
     FROM python:3.10-slim

     # Set working directory
     WORKDIR /app

     # Copy requirements first to leverage Docker cache
     COPY requirements.txt .

     # Install system dependencies and Python packages
     RUN apt-get update && apt-get install -y --no-install-recommends \
         gcc \
         && pip install --no-cache-dir -r requirements.txt \
         && apt-get purge -y --auto-remove gcc \
         && apt-get clean \
         && rm -rf /var/lib/apt/lists/*

     # Copy application files
     COPY . .

     # Run NLTK setup
     RUN python setup_nltk.py

     # Expose port (Render assigns dynamically)
     EXPOSE $PORT

     # Run Streamlit
     CMD ["sh", "-c", "streamlit run app.py --server.port $PORT --server.address 0.0.0.0"]
