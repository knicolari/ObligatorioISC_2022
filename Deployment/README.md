## Como desplegar los microservicios:
   - Una vez desplegado el codigo de terraform conectar con el cluster con el comando aws eks --region us-east-1 update-kubeconfig --name nombre_del_cluster
   - Verificar los nodos con el comando kubectl get nodes
   - Ejecutar el comando kubectl apply -f <nombre del archivo.yaml> para ir desplegando uno a uno los servicios.
   - Para verificar el despliegue utilizar el comando kubectl get all
