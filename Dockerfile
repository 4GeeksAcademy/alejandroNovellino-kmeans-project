# Usa una imagen base de Python
FROM python:3.13

# Establece el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copia los archivos requirements.txt y setup.py (si lo tienes) al contenedor
COPY requirements.txt ./

# Crea en venv
RUN python -m venv venv

# Instala los paquetes de Python
RUN venv/bin/pip install --no-cache-dir -r requirements.txt

# Copia el resto de tu código fuente al contenedor (si lo tienes)
COPY . .

# Comando para ejecutar tu aplicación (si la tienes)
CMD ["venv/bin/jupyter", "notebook", "--ip", "0.0.0.0", "--port", "8888", "--allow-root"]