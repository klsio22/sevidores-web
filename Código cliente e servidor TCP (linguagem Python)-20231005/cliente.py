#!/usr/bin/env python3

import socket


print("Cliente")

# Cria o objeto socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Obtém o nome do host e configura a porta
host = socket.gethostname()
print ("Host =",host)
port = 9999


# Conecta o socket no host e na porta especificados
s.connect((host, port))

# Envia algo
s.sendall(bytes("texto original",'UTF-8'))

# Recebe a resposta
rec = s.recv(1024)

print("Recebido",rec.decode("utf-8"))

s.close()