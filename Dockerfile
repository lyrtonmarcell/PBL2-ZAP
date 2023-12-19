# Use a imagem oficial do Python
FROM python:3.8

# Copie o script para o contêiner
COPY user.py /app/user.py

# Defina o diretório de trabalho
WORKDIR /app

# Instale as dependências do script (se houver)
RUN pip install cryptography
# Comando a ser executado quando o contêiner for iniciado
CMD ["python", "user.py"]
