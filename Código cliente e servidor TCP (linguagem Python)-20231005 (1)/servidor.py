#!/usr/bin/env python3

import socket

print("Servidor")

# Cria o objeto socket
serversocket = socket.socket(
    socket.AF_INET, socket.SOCK_STREAM)
serversocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Obtém o nome do host e configura a porta
host = socket.gethostname()
print ("Host =",host)
port = 9999

# Liga o socket ao host e porta
serversocket.bind((host, port))
serversocket.listen(1)

while True:
    clientsocket,addr = serversocket.accept()
    
    #Aguarda a conexão de um cliente
    recebido = clientsocket.recv(1024)
    if not recebido: break
    
    #transforma byte em string
    print(recebido)
    strRecebido = recebido.decode('UTF-8')
    print(str(host), ":", strRecebido)
    clientsocket.send( bytes(strRecebido.upper(), 'UTF-8'))

clientsocket.shutdown(socket.SHUT_RDWR)
clientsocket.close()