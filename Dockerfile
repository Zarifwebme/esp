FROM python:3.10-slim

# ffmpeg o'rnatish
RUN apt-get update && apt-get install -y ffmpeg

# Ishchi direktoriyani yaratish
WORKDIR /app

# Loyiha fayllarini nusxalash
COPY . .

# Kutubxonalarni o'rnatish
RUN pip install -r requirements.txt

# Botni ishga tushirish
CMD ["gunicorn", "telegram_bot:app", "--worker-class", "sync", "--timeout", "90"]
